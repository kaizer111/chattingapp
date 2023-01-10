import 'package:chattingapp/Constants/device_size.dart';
import 'package:chattingapp/Screens/ChatScreen.dart';
import 'package:chattingapp/Screens/Help.dart';
import 'package:chattingapp/Screens/Starred_messages.dart';
import 'package:chattingapp/Screens/calls/calls.dart';
import 'package:chattingapp/Screens/chats/chats.dart';
import 'package:chattingapp/Screens/floatingbutton_Actions/Qr_Code_generator/Qr_generator.dart';
import 'package:chattingapp/Screens/floatingbutton_Actions/Qr_Scanner/Qr_Scanner.dart';
import 'package:chattingapp/Screens/groups/groups.dart';
import 'package:chattingapp/Screens/newGroups.dart';
import 'package:chattingapp/Screens/profile.dart';
import 'package:chattingapp/Screens/settings.dart';
import 'package:chattingapp/main.dart';
import 'package:flutter/material.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:qr_flutter/qr_flutter.dart';
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
     super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation = CurvedAnimation(curve: Curves.easeInOut, parent: _animationController!);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
    
   
  }

  @override
 
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // leading: IconButton(
          //   onPressed: () {
          //   Navigator.pushReplacementNamed(context, '/AppScreen');
          // }, icon: Icon(Icons.logout)),
          backgroundColor: Color.fromARGB(255, 145, 193, 232),
          title: const Text("Quickchat",style: TextStyle(fontFamily: "fira"),),
          actions:  [
              PopupMenuButton(onSelected: (value){
            print(value);
            },
        color: Colors.blueGrey.shade100,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(child: ListTile(
            leading: Text('Profile',
              style: TextStyle(
                  fontSize: 16
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Profile(),));
            },
          )
          ),
          PopupMenuItem(
            child: ListTile(
            leading: Text('New groups',
              style: TextStyle(
                  fontSize: 16
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NewGroupScreen(),));
            },
          )
          ),
          PopupMenuItem(child: ListTile(
            leading: Text('Starred messages',
              style: TextStyle(
                  fontSize: 16
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StarredMessage()));
            },
          ),
          ),
          PopupMenuItem(child: ListTile(
            leading: Text('Help',
              style: TextStyle(
                  fontSize: 16
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HelpScreen()));
            },
          )
          ),

          PopupMenuItem(child: ListTile(
            leading: Text('Logout',
              style: TextStyle(
                  fontSize: 16
              ),
            ),
            onTap: () async{
              Navigator.pop(context);
              await setPref(false);
              Navigator.pushReplacementNamed(context, '/AppScreen');
            },
          )
          ),

        ];
      }
    ),
          ],
        ),
        body: chats(),
        //backgroundColor: Colors.blue.shade50,
        // body:  CustomScrollView(
        //   slivers: [
        //     SliverAppBar(
        //       backgroundColor: Colors.white,
        //       pinned: true,
        //     snap: false,
        //     floating: true,
        //     expandedHeight: 170.0,
        //     flexibleSpace:  const FlexibleSpaceBar(
        //       background: Status(),
        //     ),
        //      bottom:  TabBar
        //      (
        //       labelStyle: TextStyle(fontFamily: "fira"),
        //       controller: _tabController,
        //       indicatorColor: Colors.black,
        //       labelColor: Colors.black,
        //       indicatorSize: TabBarIndicatorSize.label,
        //       indicator: const UnderlineTabIndicator(
        //       insets: EdgeInsets.only(bottom: 8),
        //      ),
        //       tabs: const [
        //        Tab(text: 'Chats',),
        //        Tab(text: 'Groups'),
        //        Tab(text: 'calls'),
        //     ],
        //     ),
        //     ),
        //     SliverFillRemaining(
        //     child: TabBarView(
        //       controller: _tabController,
        //       children: const [
        //         Center(child: chats()),
        //         Center(child: groups()),
        //         Center(child: calls()),
        //       ],
        //     ),
        //   ),
        //   ],
          
        // ),
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => QrScanner(),));
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => QrGenerator(),));

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
