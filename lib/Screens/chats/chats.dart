import 'package:chattingapp/Constants/databseConstants.dart';
import 'package:chattingapp/Screens/chats/chattingroom.dart';
import 'package:chattingapp/model/User_model.dart';
import 'package:chattingapp/model/chat_room_model.dart';
import 'package:chattingapp/services/api/utils.dart';
import 'package:chattingapp/services/firebase/generateChatroom.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/material.dart';

class chats extends StatelessWidget {
  //const chats({super.key});
  String myuid= FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: chatroomdb.where('users',arrayContains: myuid).snapshots(),
      builder: (context,AsyncSnapshot snapshot) {
       
      if(snapshot.hasData || (snapshot.connectionState==ConnectionState.active || snapshot.connectionState==ConnectionState.done)) {
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              var listilechattime = DateTime.parse(snapshot.data.docs[index]['lastchattime']);
              String otherId = myuid==snapshot.data.docs[index]['users'][0]?snapshot.data.docs[index]['users'][1]:snapshot.data.docs[index]['users'][0];
              var k=snapshot.data.docs[index]['users'];
              return  FutureBuilder(
                future: getUserDetails(otherId),
                builder: (BuildContext context, AsyncSnapshot<UserModel> usersnapshot) {
                  if(usersnapshot.hasData) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ChattingRoom(chatRoomId:snapshot.data.docs[index]['chatroomid'] , otherUser:usersnapshot.data! ),));
                      },
                tileColor: Colors.white,
              visualDensity: VisualDensity(vertical: 2.5),
              leading: CircleAvatar(
                child: Icon(Icons.account_box),   // instead of this icon this will be the persons profile picture
              ),
              title: Text(usersnapshot.data!.name),
              subtitle: Text('Latest chats',style: TextStyle(fontFamily: "open"),),
              trailing: Text(timeago.format(listilechattime)), // this will show the current time
            );
                  }
                  else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              );
            },
          );
      }
      else {
        return Center(child: CircularProgressIndicator());
      }
    },);
  }
}