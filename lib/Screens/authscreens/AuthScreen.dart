import 'package:chattingapp/Constants/device_size.dart';
import 'package:chattingapp/Screens/authscreens/loginpage.dart';
import 'package:chattingapp/Screens/authscreens/signuppage.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/message.png",
                height: MediaQuery.of(context).size.height * 0.55,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 15,),
              const Text(
                "Hey! Welcome",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontFamily: "Play",
                    letterSpacing: 1.2,
                    color: Colors.white),
              ),
              const SizedBox(height: 15),
              Center(
                child: SizedBox(
                  width: displayWidth(context) * 0.83,
                  child: MaterialButton(
                    height: displayHeight(context) * 0.055,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                    },
                    color: Colors.blue[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 15.5),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: SizedBox(
                  width: displayWidth(context) * 0.83,
                  child: MaterialButton(
                    height: displayHeight(context) * 0.055,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage(),));
                    },
                    color: Colors.blue[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 15.5,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );;
  }
}