import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iot_ui/Models/get_sign_model.dart';
import 'package:iot_ui/settings/api_controller.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:iot_ui/Models/get_sign_model.dart';

class TestImporter extends StatefulWidget {
  @override
  TestImporterState createState() {
    return new TestImporterState();
  }
}

class TestImporterState extends State<TestImporter> {

  GetSignModel _signInfo;
  final _apiController = new ApiController();
  var counter = 0;

  void getData() async {

    StreamSubscription<List> _dataSub = _apiController.getSignInfoListLocalHost().asStream().listen((List data) {
      setState(() {
        _signInfo = data[0];
        counter = 1;
      });
    });
    if (counter == 1) {
      _dataSub.cancel();
    }
  }

  dynamic _jsonResponse;
  http.Response _response;
  Uri _uri;

  // String _ip = 'http://192.168.100.14:';
  // String _port = '45455';
  // String link  = 'http://192.168.100.14:45455/MainIOT/GetSingleSignInfo';

  String _testData;

  void getData2() async {
    _uri = Uri.parse('http://192.168.100.14:45455/MainIOT/ChangeSignStatus?SignStatus=1&SignName=Stop');
    _response = await http.put(_uri);
  }

  @override
  Widget build(BuildContext context) {
    getData2();
    // _fetchData();
    return Scaffold(
        body: new Container(
          child: Image.asset(
            "assets/icons/tenor.gif",
            height: 700.0,
            width: 700.0,
          ),
          ),


    );
  }
}
