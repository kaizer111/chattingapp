import 'package:chattingapp/Constants/device_size.dart';
import 'package:chattingapp/Screens/ChatScreen.dart';
import 'package:chattingapp/Screens/calls/calls.dart';
import 'package:chattingapp/Screens/chats/chats.dart';
import 'package:chattingapp/Screens/groups/groups.dart';
import 'package:chattingapp/Screens/searchBar.dart';
import 'package:flutter/material.dart';

import 'Screens/Status/Status.dart';

class HomePage extends StatefulWidget {
  

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
 late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
  @override
 
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: Drawer(
          // add drawer items
        ),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 145, 193, 232),
          title: const Text("Quickchat"),
          // actions:  [
          //    const Icon(Icons.search),
          //    const SizedBox(
          //     width: 20,
          //   ),
          //    IconButton(onPressed: () {
               
          //    }, icon: const Icon(Icons.account_box)),
          // ],
        ),
        backgroundColor: Colors.blue.shade50,
        body:  CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              pinned: true,
            snap: false,
            floating: true,
            expandedHeight: 170.0,
            flexibleSpace:  const FlexibleSpaceBar(
              background: Status(),
            ),
             bottom:  TabBar
             (
              labelStyle: TextStyle(),
              controller: _tabController,
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: const UnderlineTabIndicator(
              insets: EdgeInsets.only(bottom: 8),
             ),
              tabs: const [
               Tab(text: 'Chats'),
               Tab(text: 'Groups'),
               Tab(text: 'calls'),
            ],
            ),
            ),
            SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: const [
                Center(child: chats()),
                Center(child: groups()),
                Center(child: calls()),
              ],
            ),
          ),
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
