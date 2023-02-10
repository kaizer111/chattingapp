import 'package:flutter/material.dart';

import '../Constants/device_size.dart';

class EditBox extends StatefulWidget {
  const EditBox({Key? key}) : super(key: key);

  @override
  State<EditBox> createState() => _EditBoxState();
}

class _EditBoxState extends State<EditBox> {

  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,

      body: Stack(
        children: [

          Positioned(
              top: displayHeight(context)*0.05,
              left: displayWidth(context)*0.001,
              child:Image.asset('assets/images/editicon.jpg',height: displayHeight(context)*0.4,fit: BoxFit.cover,)
          ),
          Positioned(
            bottom: 0,
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))),
              elevation: 20,
              child: Container(
                padding: EdgeInsets.all(35),
                height: displayHeight(context)*0.6,
                width: displayWidth(context),
                decoration: BoxDecoration(
                    //color: Colors.teal.shade50,
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Edit Screen',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 39,
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),

                      SizedBox(
                        height: 30,
                      ),

                      Text('Name',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25
                        ),
                      ),
                      TextFormField(

                        decoration: InputDecoration(

                          hintText: "Your Name...",

                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      Text('About',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25
                        ),
                      ),
                      TextFormField(

                        decoration: InputDecoration(

                          hintText: "About...",

                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      Text('Birthday',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25
                        ),
                      ),
                      TextFormField(

                        decoration: InputDecoration(

                          hintText: "Mention your Birth Date...",

                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),


                      Text('Gender',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25
                        ),
                      ),
                      TextFormField(

                        decoration: InputDecoration(

                          hintText: "Mention your Gender...",

                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      Text('Email',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25
                        ),
                      ),
                      TextFormField(

                        decoration: InputDecoration(

                          hintText: "Your Email id....",

                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
