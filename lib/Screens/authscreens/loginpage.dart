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
                  Color(0xFF000428),
                Color(0xFF004e92),
              ],),
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Container(
                  height: 190,
                  width: 350,
                  child: Image.asset("assets/images/chatting.png",fit: BoxFit.contain)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 49, 30, 10),
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
                    prefixIcon: Icon(Icons.key,color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: MaterialButton(
                  elevation: 11,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                   color: Colors.greenAccent,
                   child: Text("Login"),
                  onPressed: () {
                  
                },),
              ),
              
            ],
          ),
        ),
      );
  }
}