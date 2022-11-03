import 'package:flutter/material.dart';

class chats extends StatelessWidget {
  const chats({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        Expanded(
          child: ListView.builder(
            itemCount: 10,
        
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return const ListTile(
              visualDensity: VisualDensity(vertical: 2.5),
              leading: CircleAvatar(
                child: Icon(Icons.account_box),   // instead of this icon this will be the persons profile picture
              ),
              title: Text('kaizer'),
              subtitle: Text('Latest chats'),
              trailing: Text('11:11'), // this will show the current time
            );
            },
          ),
        ),
      ],
    );
  }
}