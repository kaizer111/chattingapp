import 'package:chattingapp/Constants/databseConstants.dart';
import 'package:chattingapp/enum/enums.dart';
import 'package:chattingapp/model/User_model.dart';
import 'package:flutter/foundation.dart';



class UserController extends ChangeNotifier{
  UserModel? currentUser;
  UserStatus userStatus=UserStatus.NIL;

 setUser (String id) async{
  userStatus=UserStatus.LOADING;
  await Future.delayed(Duration(microseconds: 1));
  notifyListeners();
  try{
    await userdb.doc(id).get().then((usersnap) {
      currentUser = UserModel.fromJson(usersnap.data()!);
    });
  }
  catch(e){
    print(e.toString());
  }
  userStatus=UserStatus.DONE;
  notifyListeners();

 }

 createNewUser({required String name,required String email,required String uid,})async{
  try{
    print("creating new user");
    UserModel user = UserModel(uid: uid, email: email, name: name, dp: '');
    var userJson = user.toJson();
    await userdb.doc(uid).set(userJson);
    print("success in creating usr");
    currentUser=user;
  }
  catch(e){
    print(e);
  }
  userStatus=UserStatus.DONE;
  notifyListeners();
 }

  

}