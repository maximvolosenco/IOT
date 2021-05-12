import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:iot_ui/Models/get_sign_model.dart';
import 'package:iot_ui/settings/api_controller.dart';

class ImageSelectorScreen extends StatefulWidget {
  @override
  ImageSelectorScreenState createState() {
    return new ImageSelectorScreenState();
  }
}

class ImageSelectorScreenState extends State<ImageSelectorScreen> {

  List<GetSignModel> _signInfo;
  final _apiController = new ApiController();
  var counter = 0;
  int index = 0;
  bool isEmpty = false;

  void getData() async {
    StreamSubscription<List> _dataSub = _apiController.getSignInfoListLocalHost().asStream().listen((List data) {
      setState(() {
        _signInfo = data;
        counter = 1;
      });
    });
    if (counter == 1) {
      _dataSub.cancel();
    }
  }

  Widget loadingScreen(){
    return Scaffold(
        backgroundColor: Colors.black,
        body:  Container(
          alignment: Alignment.center,
          child: Image.asset(
            "assets/icons/tenor.gif",
            height: 700.0,
            width: 700.0,
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    getData();
    if (isEmpty){
      return Scaffold(
          backgroundColor: Colors.black,
          body:  Container(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/icons/tenor.gif",
              height: 700.0,
              width: 700.0,
            ),
          )
      );
    }
    return Scaffold(
      backgroundColor: Colors.black87,
        body: Container(
          child: Column(
            children: [
              _createSpace(2),
              Text(_signInfo[index].SignName,
                textAlign: TextAlign.center,
                style: new TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
              _createSpace(2),
              // Text(_signInfo.SignPhoto.toString()),
              new Container(
                child: new Container(
                  width: 400,
                  height: 430,
                ),
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(10.0),
                  color: Colors.grey,
                  image: new DecorationImage(
                      image: MemoryImage(base64Decode(_signInfo[index].SignPhoto)),
                      fit: BoxFit.cover,
                      ),
                  boxShadow: [
                    new BoxShadow(
                        color: Color(0xff3C3261),
                        blurRadius: 5.0,
                        offset: new Offset(2.0, 5.0))
                  ],
                ),
              ),
              _createSpace(5),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _createButton(29, 20, "RIGHT", Colors.green, 1),
                _createButton(10, 20, "SKIP", Colors.blue, 10),
                _createButton(25, 20, "WRONG", Colors.red, -1),
              ],
            )
            ],
          ),
          ),
    );
  }

  Widget _createButton(double hEdge, double vEdge, String buttonName, Color color, int status){
    return new ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
        padding: EdgeInsets.symmetric(horizontal: hEdge, vertical: vEdge),
      ),
      onPressed: () {
        _apiController.putSignStatusLocalHost(_signInfo[index].SignName, status);

        setState(() {
          if (index + 1 == _signInfo.length){
            isEmpty = true;
          } else {
            index += 1;
          }
        }
        );
      },
      child: new Text(
        buttonName,
        style: new TextStyle(
            fontSize: 25
        ),
      ),
    );
  }
  Widget _createSpace(double edgeAll){
    return new Container(
      padding: EdgeInsets.all(edgeAll),
    );
  }

}