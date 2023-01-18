import 'package:chattingapp/Screens/authscreens/AuthScreen.dart';
import 'package:chattingapp/Screens/authscreens/loginpage.dart';
import 'package:chattingapp/Screens/authscreens/signuppage.dart';
import 'package:chattingapp/Screens/chats/chattingroom.dart';
import 'package:chattingapp/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Homepage.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserController(),)
      ],
      child: MaterialApp(
        home: FutureBuilder(
          future: getPref(),
          builder: (context, AsyncSnapshot<bool> snapshot) {
          if(snapshot.connectionState==ConnectionState.active||snapshot.connectionState==ConnectionState.done){
                if(snapshot.hasData){
                  if(snapshot.data!)
                    return HomePage();
                  else return AuthScreen();
                } else return LoginPage();
              } 
              else return Scaffold();
        },),
        debugShowCheckedModeBanner: false,
    
        routes: {
          '/HomePage' :(context) => HomePage(),
          '/AppScreen':(context) => AuthScreen(),
          '/chattingroom':(context) => ChattingRoom(),
        },
      ),
    );
  }
}

Future<bool> getPref() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = false;
  if(prefs.containsKey('login')){
    isLoggedIn = prefs.getBool('login')!;
  }
  return isLoggedIn;
}

Future<void> setPref(bool val) async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('login', val);
}
