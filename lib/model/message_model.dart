import 'package:flutter/material.dart';

class MessageModel {
  String senderid;
  DateTime senttime;
  String message;
  String messageid;

  MessageModel({required this.senderid,required this.senttime,required this.message,required this.messageid});

  Map<String,dynamic> toJson(){
    return {
      'senttime':senttime.toString(),
      'senderid':senderid,
      'message':message,
      'messageid':messageid,
      };
  }

  factory MessageModel.fromJson(Map<String,dynamic> json){
    return MessageModel( senttime: DateTime.parse(json['senttime']), senderid: json['Senderid'],message: json['message'],messageid: json['messageid']);
  }
}