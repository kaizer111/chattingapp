import 'package:chattingapp/Constants/device_size.dart';
import 'package:chattingapp/Homepage.dart';
import 'package:chattingapp/main.dart';
import 'package:chattingapp/services/firebase/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chattingapp/Screens/authscreens/AuthScreen.dart';

class LoginPage extends StatefulWidget {
   LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool Loadscreen =false;
    final Authservice auth= Authservice();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

    final _formkey= GlobalKey<FormState>();
    bool ishiddenPassword = true;

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
          body: Form(
            key: _formkey,
            child: Column(
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
                    style: TextStyle(color: Colors.white),
                    controller: emailController,
                    validator: (val) {
                       if (val!.isEmpty) return "email cannot be empty";
                        },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(35),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(35),
                      ),
                      label: Text("Email",style: TextStyle(color: Colors.white),),
                      prefixIcon: Icon(Icons.email , color: Colors.white,),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(35),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 25, 30, 10),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    obscureText: ishiddenPassword,
                    controller: passwordController,
                    validator: (val) {
                       if (val!.isEmpty) return "password cannot be empty";
                        },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(35),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(35),
                      ),
                     // hintText: "Password",
                      label: Text("Password",style: TextStyle(color: Colors.white),),
                      suffixIcon: IconButton(
                        onPressed: () {
                        setState(() {
                          ishiddenPassword=!ishiddenPassword;
                        });
                      }, icon: ishiddenPassword
                         ?Icon(Icons.visibility,color: Colors.white,)
                         :Icon(Icons.visibility_off,color: Colors.white,)),
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
                      onPressed: () async{
                            setState(() {
                              Loadscreen=true;
                            });
                            if(_formkey.currentState!.validate() ) {
                              final dynamic response= await auth.signIn(email: emailController.text, password: passwordController.text);
                               setState(() {
                              Loadscreen=false;
                            });
                              if(response.runtimeType!=UserCredential)
                              {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response)));
                                 
                              }
                              else {
                                await setPref(true);
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
                                //  Navigator.pushReplacementNamed(context, '/HomePage');
                              }
                            }
                           
                             
                      },
                      color: Colors.blue[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Loadscreen==false?Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 15.5,
                        ),
                      ):CircularProgressIndicator(),
                    ),
                  ),
                  ),
                ),
                
              ],
            ),
          ),
        ),
      );
  }
}