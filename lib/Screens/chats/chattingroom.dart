import 'package:chattingapp/Constants/databseConstants.dart';
import 'package:chattingapp/controllers/user_controller.dart';
import 'package:chattingapp/model/message_model.dart';
import 'package:flutter/material.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:chattingapp/model/User_model.dart';


class ChattingRoom extends StatelessWidget {
  String chatRoomId;
  UserModel otherUser;

   ChattingRoom({super.key,required this.chatRoomId,required this.otherUser});

   String myuid=FirebaseAuth.instance.currentUser!.uid;
   TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 145, 193, 232),
        title: Text(userController.currentUser!=null? 
              "${userController.currentUser!.name}":'anonymus'),
        actions: [
          PopupMenuButton(onSelected: (value){
            print(value);
            },
        color: Colors.blueGrey.shade100,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(child: ListTile(
            leading: Text('Report',
              style: TextStyle(
                  fontSize: 16
              ),
            ),
            onTap: () {
            },
          )
          ),
          PopupMenuItem(
            child: ListTile(
            leading: Text('Block',
              style: TextStyle(
                  fontSize: 16
              ),
            ),
            onTap: () {
            },
          )
          ),
          PopupMenuItem(child: ListTile(
            leading: Text('Clear chat',
              style: TextStyle(
                  fontSize: 16
              ),
            ),
            onTap: () {
            },
          ),
          ),
          PopupMenuItem(child: ListTile(
            leading: Text('search',
              style: TextStyle(
                  fontSize: 16
              ),
            ),
            onTap: () {
            },
          )
          ),

        ];
      }
    ),
        ],
      ),
      body: CommentBox(
          backgroundColor: Colors.white,
          commentController: messageController,
          withBorder: true,
          textColor: Colors.black,
          sendWidget: IconButton(onPressed: () async{
            if(messageController.text.isNotEmpty) {
              print("mesage = ${messageController.text}");
              MessageModel messageModel = MessageModel(senderid: myuid, senttime: DateTime.now(), message: messageController.text, messageid: '');
              var msgres= await chatroomdb.doc(chatRoomId).collection('messages').add(messageModel.toJson());
              await chatroomdb.doc(chatRoomId).collection("messages").doc(msgres.id).update({'messageid':msgres.id});
              messageController.clear();
            }
          }, icon: Icon(Icons.send)),
          child: StreamBuilder(
                stream: chatroomdb.doc(chatRoomId).collection('messages').orderBy('senttime',descending: false).snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if(snapshot.hasData) {
                      return ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: (snapshot.data.docs[index]['senderid']==myuid)?MainAxisAlignment.end:MainAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Container(
                              constraints: BoxConstraints(maxWidth: 200),
                                decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),color: Colors.grey[200]
                                ),
                                padding: EdgeInsets.all(8),
                                child: Text(snapshot.data.docs[index]['message']),
                              ),
                            ),
                          ],
                        ),
                      );
                  },);
                  }
                  else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
      ),
    );
  }
}