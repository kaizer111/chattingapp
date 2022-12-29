import 'package:chattingapp/Constants/device_size.dart';
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
                Color(0xFF36d1dc),
                Color(0xFF5b86e5),
              ],),
        ),
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              //   child: Container(
              //     height: 130,
              //     width: 350,
              //     child: Image.asset("assets/images/chattingicon.png",fit: BoxFit.contain)),
              // ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 10, 0),
                child: Text("Create an Accunt",style: TextStyle(color: Colors.white,fontSize: 30,fontFamily: "play"),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle,color: Colors.white,),
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
                    suffixIcon: Icon(Icons.visibility,color: Colors.white,),
                    label: Text("Password",style: TextStyle(color: Colors.white),),
                    prefixIcon: Icon(Icons.key , color: Colors.white,),
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
                    suffixIcon: Icon(Icons.visibility,color: Colors.white,),
                    label: Text("Confirm Password",style: TextStyle(color: Colors.white),),
                    prefixIcon: Icon(Icons.key , color: Colors.white,),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
               Padding(
                 padding: const EdgeInsets.fromLTRB(30, 0, 0, 10),
                 child: Checkbox(

                  shape: CircleBorder(),
                  value: false, 
                  onChanged: (value) {
                  
              },),
               ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Text("I accept al the terms and Conditions",style: TextStyle(color: Colors.white),),
              )
                ],
              ),
              Center(
                child: SizedBox(
                  width: displayWidth(context) * 0.83,
                  child: MaterialButton(
                    height: displayHeight(context) * 0.055,
                    onPressed: () {
                          
                    },
                    color: Colors.blue[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      "SignUp",
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
      );
  }
}