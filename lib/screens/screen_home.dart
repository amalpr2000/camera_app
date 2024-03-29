import 'package:camera_app/screens/screen_gallery.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

XFile? image;
String? imagepath;
ValueNotifier<List> galleryNotifier = ValueNotifier([]);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    getAllImages();
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Camera'))),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('                  '),
            FloatingActionButton(
              onPressed: () => getImage(source: ImageSource.camera),
              child: const Icon(Icons.camera_alt_outlined),
            ),
            FloatingActionButton(
              heroTag: null,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const Gallery();
                  },
                ));
              },
              child: const Icon(Icons.image),
            ),
          ],
        ),
      ),
    );
  }

  getImage({required ImageSource source}) async {
    image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      setState(() {
        imagepath = (image!.path);
        add();
      });
    } else {
      return null;
    }
  }
}
