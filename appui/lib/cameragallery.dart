import 'dart:io';
import 'package:appui/recommendation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraGallery extends StatefulWidget {
  @override
  _CameraGalleryState createState() => _CameraGalleryState();
}

class _CameraGalleryState extends State<CameraGallery> {
  File? _image;
  final picker = ImagePicker();
  bool _loading = true;

  pickImage() async {
    var image = await picker.getImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    }

    setState(() {
      _image = File(image.path);
      _loading = false;
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
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back,
                      color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.8)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )),
            SizedBox(height: 20.0),
            Center(
                child: _loading
                    ? Container(
                        child: Column(
                        children: const <Widget>[
                          SizedBox(height: 180.0),
                          Text(
                            "The selected image",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: 'Montserrat',
                              fontSize: 30.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Text(
                            "will be shown here.",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: 'Montserrat',
                              fontSize: 30.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 60.0,
                          ),
                        ],
                      ))
                    : Container(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.file(_image!,
                                width: 300, height: 300, fit: BoxFit.cover))
// Image. network
// CliDRRect
                        )),
            const SizedBox(height: 40.0),
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
                      color: Color.fromARGB(255, 255, 255, 255),
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
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontFamily: 'Montserrat',
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
            ),
            const SizedBox(
              height: 80.0,
            ),
            Padding(
                padding: EdgeInsets.only(left: 90.0, top: 10.0, right: 90.0),
                child: !_loading
                    ? Container(
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.black,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Recommendation()));
                          },
                          child: Container(
                            height: 40.0,
                            width: 40.0,
                            child: const Icon(Icons.arrow_forward_outlined,
                                color: Colors.white, size: 30.0),
                          ),
                        ))
                    : Container()),
          ],
        ),
      ),
    );
  }
}
