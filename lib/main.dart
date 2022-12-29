import 'package:chattingapp/Screens/authscreens/AuthScreen.dart';
import 'package:chattingapp/Screens/authscreens/loginpage.dart';
import 'package:chattingapp/Screens/authscreens/signuppage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Homepage.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return  MaterialApp(
      home: AuthScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
