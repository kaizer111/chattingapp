import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatRoomModel {
final String user1id;
final String user2id;
final Timestamp lastchattime;
final String chatroomid;

ChatRoomModel({required this.user1id,required this.user2id,required this.lastchattime,required this.chatroomid});

 Map<String,dynamic> toJson(){
    return {
      'user1id':user1id,
      'user2id':user2id,
      'lastchattime':lastchattime,
      'chatroomid':chatroomid,
      };
  }

  factory ChatRoomModel.fromJson(Map<String,dynamic> json){
    return ChatRoomModel(user1id: json['user1id'], user2id: json['user2id'], lastchattime: json['lastchattime'], chatroomid: json['chatroomid']);
  }

}