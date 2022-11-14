import 'package:flutter/material.dart';

class groups extends StatelessWidget {
  const groups({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                tileColor: Colors.white,
              leading: CircleAvatar(
                child: Icon(Icons.play_circle_fill),  // instead of icon this will be an image or groups profile picture
              ),
              title: Text('Movies'),
              subtitle: Text('latest chats in this group'),
              trailing: Text('11:11'),  // this will be current time 
            );
            },
          ),
        ),
      ],
    );
  }
}