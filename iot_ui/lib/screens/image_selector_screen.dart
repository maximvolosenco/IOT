import 'package:flutter/material.dart';

class ImageSelectorScreen extends StatefulWidget {
  @override
  ImageSelectorScreenState createState() {
    return new ImageSelectorScreenState();
  }
}

class ImageSelectorScreenState extends State<ImageSelectorScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Image.network('https://i.pinimg.com/564x/9a/be/5f/9abe5f0ad84b083a1a52dac183c7bc89.jpg')
        // new Container(
        //
        // )
    );
  }

}