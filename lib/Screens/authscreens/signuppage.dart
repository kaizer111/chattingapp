import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
              Container(
                height: 150,
                width: 350,
                child: Image.asset("assets/images/chattingicon.png",fit: BoxFit.contain)),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    label: Text("Name",style: TextStyle(color: Colors.white),),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
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
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    label: Text("Password",style: TextStyle(color: Colors.white),),
                    prefixIcon: Icon(Icons.key , color: Colors.white,),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 30),
                child: TextFormField(
                  decoration: InputDecoration(label: Text("Confirm Password",style: TextStyle(color: Colors.white),),
                    prefixIcon: Icon(Icons.key , color: Colors.white,),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),
                ),
              ),
              MaterialButton(
                elevation: 11,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                 color: Colors.greenAccent,
                 child: Text("Signup"),
                onPressed: () {
                
              },),
              
            ],
          ),
        ),
      );
  }
}