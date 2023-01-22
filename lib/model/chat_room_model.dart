import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatRoomModel {
final DateTime lastchattime;
final String chatroomid;
List<String> users;

ChatRoomModel({required this.lastchattime,required this.chatroomid,required this.users});

 Map<String,dynamic> toJson(){
    return {
      'lastchattime':lastchattime.toString(),
      'chatroomid':chatroomid,
       'users':users
      };
  }

  factory ChatRoomModel.fromJson(Map<String,dynamic> json){
    return ChatRoomModel( lastchattime: DateTime.parse(json['lastchattime']), chatroomid: json['chatroomid'],users: json['users']);
  }

}


