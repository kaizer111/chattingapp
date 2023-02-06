import 'package:chattingapp/Constants/device_size.dart';
import 'package:chattingapp/Screens/authscreens/AuthScreen.dart';
import 'package:chattingapp/controllers/user_controller.dart';
import 'package:chattingapp/main.dart';
import 'package:chattingapp/services/firebase/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
   SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
   final Authservice auth= Authservice();
  bool Loadscreen =false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();


  final _formkey= GlobalKey<FormState>();
  bool hiddensignuppassword = true;
  bool hiddenconformpassword=true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            // appBar: AppBar(
            //   elevation: 0,
            //   backgroundColor: Color(0xFF5b86e5),
            // ),
            backgroundColor: Colors.transparent,
            body: Form(
              key: _formkey,
              child: Container(
                height: double.infinity,
                decoration: const BoxDecoration(
             gradient: LinearGradient(begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF36d1dc),
                  Color(0xFF5b86e5),
                ],),
                  ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      //   child: Container(
                      //     height: 130,
                      //     width: 350,
                      //     child: Image.asset("assets/images/chattingicon.png",fit: BoxFit.contain)),
                      // ),
                      IconButton(onPressed: () {
                        Navigator.pop(context);
                      }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 10, 0),
                        child: Text("Create an Accunt",style: TextStyle(color: Colors.white,fontSize: 30,fontFamily: "play"),),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                        child: TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          validator: (val) {
                           if (val!.isEmpty) return "name cannot be empty";
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
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) {
                            if (val!.isEmpty) return "Email cannot be empty";
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
                          obscureText: hiddensignuppassword,
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
                            suffixIcon: IconButton(
                              onPressed: () {
                              setState(() {
                                hiddensignuppassword=!hiddensignuppassword;
                              });
                            }, icon: hiddensignuppassword
                            ?Icon(Icons.visibility,color: Colors.white,)
                            :Icon(Icons.visibility_off,color: Colors.white,)),
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
                          obscureText: hiddenconformpassword,
                          controller: confirmpasswordController,
                          validator: (val) {
                            if (val!.isEmpty) return "password cannot be empty";
                            if(passwordController.text!=confirmpasswordController.text) 
                            return "password don't match";
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
                            suffixIcon: IconButton(
                              onPressed: () {
                              setState(() {
                                hiddenconformpassword=!hiddenconformpassword;
                              });
                            }, icon: hiddenconformpassword
                            ?Icon(Icons.visibility,color: Colors.white,)
                            :Icon(Icons.visibility_off,color: Colors.white,)),
                            label: Text("Confirm Password",style: TextStyle(color: Colors.white),),
                            prefixIcon: Icon(Icons.key , color: Colors.white,),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: const [
                      //  Padding(
                      //    padding: const EdgeInsets.fromLTRB(30, 0, 0, 10),
                      //    child: Checkbox(
                            
                      //     shape: CircleBorder(),
                      //     value: false, 
                      //     onChanged: (value) {
                          
                      // },),
                      //  ),
                      // const Padding(
                      //   padding:  EdgeInsets.fromLTRB(0, 0, 0, 10),
                      //   child: Text("I accept all the terms and Conditions",style: TextStyle(color: Colors.white),),
                      // ),
                        ],
                      ),
                      Center(
                        child: SizedBox(
                          width: displayWidth(context) * 0.83,
                          child: Consumer<UserController>(
                            builder: (context, userCtr, child) {
                              return  MaterialButton(
                              height: displayHeight(context) * 0.055,
                              onPressed: () async{
                                    
                                    setState(() {
                                      Loadscreen=true;
                                    });
                                    if(_formkey.currentState!.validate() ) {
                                      final dynamic response= await auth.signUp(email: emailController.text, password: passwordController.text);
                                      if(response.runtimeType!=UserCredential)
                                      {
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response)));
                                         
                                      }
                                      else {
                                      
                                        userCtr.createNewUser(email: emailController.text,name: nameController.text,uid: (response as UserCredential).user!.uid);
                                        await setPref(true);
                                         Navigator.pushReplacementNamed(context, '/HomePage');
                                      }
                                    }
                                    setState(() {
                                      Loadscreen=false;
                                    });
                                     
                              },
                              color: Colors.blue[100],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Loadscreen==false ? const Text(
                                "SignUp",
                                style: TextStyle(
                                  fontSize: 15.5,
                                ),
                              ): CircularProgressIndicator(),
                            ) ;
                            },
                          )
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        
    );
  }
}


