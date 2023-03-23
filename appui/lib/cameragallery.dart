import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraGallery extends StatefulWidget {
  @override
  _CameraGalleryState createState() => _CameraGalleryState();
}

class _CameraGalleryState extends State<CameraGallery> {
  File? _image;
  final picker = ImagePicker();
  final _textController = TextEditingController();

  pickImage() async {
    var image = await picker.getImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    }

    setState(() {
      _image = File(image.path);
    });
  }

  takePhoto() async {
    var image = await picker.getImage(source: ImageSource.camera);
    if (image == null) {
      return null;
    }

    setState(() {
      _image = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: takePhoto,
              child: Container(
                  width: MediaQuery.of(context).size.width - 190,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 17),
                  decoration: BoxDecoration(
                      color: Color(0xFF399D63),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: const Text(
                    "Take a photo",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
            ),
            const SizedBox(height: 30.0),
            GestureDetector(
              onTap: pickImage,
              child: Container(
                  width: MediaQuery.of(context).size.width - 190,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 17),
                  decoration: BoxDecoration(
                      color: Color(0xFF399D63),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: const Text(
                    "Open Gallery",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
            ),
            const SizedBox(
              height: 25.0,
            ),
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: "enter your location",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                    onPressed: () {
                      _textController.clear();
                    },
                    icon: const Icon(Icons.clear)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
