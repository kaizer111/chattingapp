import 'package:chattingapp/Constants/device_size.dart';
import 'package:chattingapp/Screens/calls/calls.dart';
import 'package:chattingapp/Screens/chats/chats.dart';
import 'package:chattingapp/Screens/groups/groups.dart';
import 'package:flutter/material.dart';

class Chatscreen extends StatefulWidget {
  const Chatscreen({Key? key}) : super(key: key);

  @override
  State<Chatscreen> createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          DefaultTabController(
            length: 3,
            initialIndex: 0,
             child: Column(
              children: [
                  TabBar(
                    labelColor: Colors.blue[300],
                    unselectedLabelColor: Colors.black,
                    tabs: const [
                      Tab(text: 'Chats'),
                      Tab(text: 'Groups'),
                      Tab(text: 'Calls'),
                    ],
                  ),
              Container(
                height: displayHeight(context)*0.48, //height of TabBarView
                decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                ),
                child: const TabBarView(children: <Widget> [
                   chats(),
                   groups(),
                   calls(),
                ]
                ),)
              ],
             )
             ),
        ],
      ),
    );

  }
}
