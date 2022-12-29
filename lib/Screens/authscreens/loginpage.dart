import 'package:chattingapp/Constants/device_size.dart';
import 'package:chattingapp/Homepage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
           gradient: LinearGradient(begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF36d1dc),
                Color(0xFF5b86e5),
              ],),
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              //   child: Container(
              //     height: 190,
              //     width: 350,
              //     child: Image.asset("assets/images/chatting.png",fit: BoxFit.contain)),
              // ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 10, 0),
                child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 45,fontFamily: "play"),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 40, 30, 10),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    label: Text("Email",style: TextStyle(color: Colors.white),),
                    prefixIcon: Icon(Icons.email , color: Colors.white,),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 25, 30, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                   // hintText: "Password",
                    label: Text("Password",style: TextStyle(color: Colors.white),),
                    suffixIcon: Icon(Icons.visibility,color: Colors.white,),
                    prefixIcon: Icon(Icons.key,color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: SizedBox(
                  width: displayWidth(context) * 0.83,
                  child: MaterialButton(
                    height: displayHeight(context) * 0.055,
                    onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                    },
                    color: Colors.blue[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 15.5,
                      ),
                    ),
                  ),
                ),
                ),
              ),
              
            ],
          ),
        ),
      );
  }
}