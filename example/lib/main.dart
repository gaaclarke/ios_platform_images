import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:native_images/native_images.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ImageProvider _image;

  @override
  void initState() {
    super.initState();
    initImage();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initImage() async {
    ImageProvider image;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      image = await NativeImages.load("pug");
    } on PlatformException {
      print("unable to load image");
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _image = image;
    });
  }

  Widget makeChild() {
    if (_image != null) {
      return Image(
        image: _image,
      );
    } else {
      return Text("no image loaded");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: makeChild(),
        ),
      ),
    );
  }
}
