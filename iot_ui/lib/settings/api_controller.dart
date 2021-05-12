import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:iot_ui/Models/get_sign_model.dart';


class ApiController {

  dynamic _jsonResponse;
  http.Response _response;
  Uri _uri;

  final String _ip = 'http://192.168.100.14:';
  final String _port = '45455';
  static String getSignInfoList;
  static String changeSignStatus;
  ApiController() {
    getSignInfoList = _ip + _port + '/MainIOT/GetSingleSignInfo';
    changeSignStatus = _ip + _port + '/MainIOT/ChangeSignStatus';
  }

  Future<List> getSignInfoListLocalHost() async {
    var url = getSignInfoList;
    _uri = Uri.parse(url);
    _response = await http.get(_uri);
    Iterable _jsonResponse = json.decode(_response.body);
    List<GetSignModel> signList = _jsonResponse.map((model) => GetSignModel.fromJson(model)).toList();

    // var entertainmentData = GetSignModel.fromJson(_jsonResponse);
    // List<GetSignModel> entertainmentList = [entertainmentData];
    return signList;
  }

  void putSignStatusLocalHost(String signName, int signStatus) async {
    var url = changeSignStatus + '?SignStatus=' + signStatus.toString() + '&SignName=' + signName;
    _uri = Uri.parse(url);
    _response = await http.put(_uri);
  }
}