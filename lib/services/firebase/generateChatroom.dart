import 'package:chattingapp/Constants/databseConstants.dart';
import 'package:chattingapp/model/chat_room_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


createChatroom(String otheruserid)async {
  String myuid= FirebaseAuth.instance.currentUser!.uid;
  String chatroomid = await generateChatRoomId(otheruserid);
  try {
    ChatRoomModel chatRoomModel = ChatRoomModel(user1id: myuid, user2id:otheruserid, lastchattime: Timestamp.now(), chatroomid: chatroomid);
    await chatroomdb.doc(chatroomid).set(chatRoomModel.toJson());
  } catch (e) {
    print(e.toString());
  }
}


generateChatRoomId (String otheruserid) async{
  String myuid=FirebaseAuth.instance.currentUser!.uid;
  if(otheruserid!=myuid){
     String myuid=FirebaseAuth.instance.currentUser!.uid;
  String chatroomid = (myuid.compareTo(otheruserid)<0)?(myuid+otheruserid):(otheruserid+myuid);
  return chatroomid;
  }
  else{
    return;
  }
}

