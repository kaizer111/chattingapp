import 'package:flutter/material.dart';

class UserModel {
  String uid;
  String name;
  String email;
  String dp;

  UserModel({required this.uid,required this.email,required this.name,required this.dp});

  Map<String,dynamic> toJson(){
    return {
      'uid':uid,
      'name':name,
      'email':email,
      'dp':dp,
      };
  }

  factory UserModel.fromJson(Map<String,dynamic> json){
    return UserModel(uid: json['uid'], email: json['email'], name: json['name'], dp: json['dp']);
  }

}
