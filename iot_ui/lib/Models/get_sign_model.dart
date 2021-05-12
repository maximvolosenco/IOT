import 'dart:typed_data';

class GetSignModel {

  final String SignName;
  final String SignPhoto;
  final String StreetName;

  GetSignModel(
      this.SignName,
      this.SignPhoto,
      this.StreetName
      );
  factory GetSignModel.fromJson(Map<String, dynamic> json){
    return GetSignModel(
        json['signName'] ?? '',
        json['signPhoto'] ?? '',
        json['streetName'] ?? '');
  }
}