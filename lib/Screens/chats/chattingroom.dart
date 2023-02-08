import 'package:chattingapp/Constants/databseConstants.dart';
import 'package:chattingapp/controllers/user_controller.dart';
import 'package:chattingapp/model/message_model.dart';
import 'package:chattingapp/services/api/utils.dart';
import 'package:flutter/material.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:chattingapp/model/User_model.dart';
import 'package:timeago/timeago.dart' as timeago;


class ChattingRoom extends StatefulWidget {
  String chatRoomId;
  UserModel otherUser;

   ChattingRoom({super.key,required this.chatRoomId,required this.otherUser});

  @override
  State<ChattingRoom> createState() => _ChattingRoomState();
}

class _ChattingRoomState extends State<ChattingRoom> {
   String myuid=FirebaseAuth.instance.currentUser!.uid;

   TextEditingController messageController = TextEditingController();

   ScrollController _scrollController=ScrollController();
   bool _needsScroll=true;


     _scrollToEnd() async {
    if (_needsScroll) {
      _needsScroll = true;
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: Duration(microseconds: 100 ), curve: Curves.easeOut);
    }
  }

  @override
  Widget build(BuildContext context) { 
    final userController = Provider.of<UserController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 145, 193, 232),
        title: Text(widget.otherUser.name),
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
          userImage: AssetImage('assets/images/heirs.jpg'),
          backgroundColor: Colors.white,
          commentController: messageController,
          withBorder: true,
          textColor: Colors.black,
          sendWidget: IconButton(
            onPressed: () async{ 
              // _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: Duration(milliseconds: 10), curve: Curves.easeOut);
            if(messageController.text.isNotEmpty) {
              print("mesage = ${messageController.text}");
              MessageModel messageModel = MessageModel(senderid: myuid, senttime: DateTime.now(), message: messageController.text, messageid: '');
              var msgres= await chatroomdb.doc(widget.chatRoomId).collection('messages').add(messageModel.toJson());
              await chatroomdb.doc(widget.chatRoomId).collection("messages").doc(msgres.id).update({'messageid':msgres.id});
              messageController.clear();
            }
             _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: Duration(milliseconds: 10), curve: Curves.easeOut);
          }, icon: Icon(Icons.send)),
          child: StreamBuilder(
                stream: chatroomdb.doc(widget.chatRoomId).collection('messages').orderBy('senttime',descending: false).snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if(snapshot.hasData) {
                    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToEnd());
                      return ListView.builder(
                        shrinkWrap: true,
                        controller: _scrollController,
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                   
                         var chattingtime = DateTime.parse(snapshot.data.docs[index]['senttime']);
                     //   print(chattingtime.day);
                        return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: (snapshot.data.docs[index]['senderid']==myuid)?MainAxisAlignment.end:MainAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                child: Container(       
                                constraints: BoxConstraints(maxWidth: 200),
                                  decoration: BoxDecoration(
                                  gradient: (snapshot.data.docs[index]['senderid']==myuid)?LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 187, 193, 227),
                                      Color.fromARGB(255, 187, 193, 227),
                                  ]):LinearGradient(                     
                                    colors: [
                                      Color.fromARGB(255, 232, 234, 246),
                                      Color.fromARGB(255, 232, 234, 246),
                                  ]),
                                  borderRadius: BorderRadius.circular(15),color: Colors.grey[200]
                                  ),
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
                                        child: Text(snapshot.data.docs[index]['message'],style: TextStyle(fontFamily: 'fira')),
                                      ),
                                      Text(timeago.format(chattingtime,locale: 'en_short',),style: TextStyle(fontSize: 10),),
                                    ],
                                  ),
                                ),
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