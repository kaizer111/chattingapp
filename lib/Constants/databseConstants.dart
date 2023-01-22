import 'package:cloud_firestore/cloud_firestore.dart';

var userdb= FirebaseFirestore.instance.collection("users");

var chatroomdb = FirebaseFirestore.instance.collection("chatrooms");