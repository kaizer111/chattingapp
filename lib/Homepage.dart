import 'package:chattingapp/Constants/device_size.dart';
import 'package:chattingapp/Screens/ChatScreen.dart';
import 'package:chattingapp/Screens/calls/calls.dart';
import 'package:chattingapp/Screens/chats/chats.dart';
import 'package:chattingapp/Screens/groups/groups.dart';
import 'package:chattingapp/Screens/searchBar.dart';
import 'package:flutter/material.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'Screens/Status/Status.dart';

class HomePage extends StatefulWidget {
  

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
 late TabController _tabController;
  Animation<double>? _animation;
   AnimationController? _animationController;
  
  
  @override
  void initState() {
    
    _tabController = TabController(length: 3, vsync: this);
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation = CurvedAnimation(curve: Curves.easeInOut, parent: _animationController!);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
    
    super.initState();
    super.initState();
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
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton:  FloatingActionBubble(
        // Menu items
        items: [

          // Floating action menu item
          Bubble(
            title:"QuickScan",
            iconColor :Colors.white,
            bubbleColor : Colors.blue,
            icon:Icons.qr_code_scanner,
            titleStyle:TextStyle(fontSize: 16 , color: Colors.white),
            onPress: () {
              _animationController!.reverse();
            },
          ),
          // Floating action menu item
          Bubble(
            title:"QuickQr",
            iconColor :Colors.white,
            bubbleColor : Colors.blue,
            icon:Icons.qr_code,
            titleStyle:TextStyle(fontSize: 16 , color: Colors.white),
            onPress: () {
              _animationController!.reverse();
            },
          ),
          //Floating action menu item
          
        ],

        // animation controller
        animation: _animation!,

        // On pressed change animation state
        onPress: () => _animationController!.isCompleted
              ? _animationController!.reverse()
              : _animationController!.forward(),
        
        // Floating Action button Icon color
        iconColor: Colors.white,

        // Flaoting Action button Icon 
        iconData: Icons.add, 
        backGroundColor: Colors.blue,
      )
      ),
    );
  }
}
