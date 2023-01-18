import 'package:flutter/material.dart';
import 'package:comment_box/comment/comment.dart';


class ChattingRoom extends StatelessWidget {
  const ChattingRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: Text('kakashi'),
        actions: [
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
            },
          )
          ),

          PopupMenuItem(child: ListTile(
            leading: Text('Logout',
              style: TextStyle(
                  fontSize: 16
              ),
            ),
            onTap: () {
            },
          )
          ),

        ];
      }
    ),
        ],
      ),
      body: CommentBox(
          backgroundColor: Colors.white,
          //commentController: ,
          withBorder: true,
          textColor: Colors.black,
          sendWidget: IconButton(onPressed: () {
            
          }, icon: Icon(Icons.send)),
          child: Text('data'),
      ),
    );
  }
}