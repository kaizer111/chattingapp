import 'package:chattingapp/Constants/databseConstants.dart';
import 'package:chattingapp/model/User_model.dart';

Future<UserModel> getUserDetails(String uid)async{
  UserModel user= UserModel(uid: uid, email:'', name: '', dp: '');
  try {
    await userdb.doc(uid).get().then((value) => user = UserModel.fromJson(value.data()!));
  } catch (e) {
    print(e);
  }
  return user;
}