import 'package:chattingapp/Constants/device_size.dart';
import 'package:chattingapp/Screens/ChatScreen.dart';
import 'package:chattingapp/Screens/searchBar.dart';
import 'package:flutter/material.dart';

import 'Screens/Status.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade50,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                     const  Padding(
                        padding:  EdgeInsets.all(10.0),
                        child: Text(
                          'Quickchat',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          //add a drawer
                        },
                        child: const CircleAvatar(
                          backgroundImage: AssetImage('assets/images/jimin.jpg'),
                          radius: 25,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: displayHeight(context) * 0.03,
                  ),
                  SearchBar(),

                 // SizedBox(
                 //   height: displayHeight(context)*0.03,
                 // ),

                 SizedBox(
                   height: displayHeight(context)*0.15,
                     child: Expanded(child: Status())),

                ],
              ),
            ),
            Positioned(
                bottom: 0,
                child: Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  elevation: 20,
                  child: Container(
                    height: displayHeight(context) * 0.60,
                    width: displayWidth(context),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: const Padding(
                      padding:  EdgeInsets.all(16.0),
                      child: Chatscreen()
                    ),
                  ),
                )),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
          // onclick it will open more options 
        },
        ),
      ),
    );
  }
}
