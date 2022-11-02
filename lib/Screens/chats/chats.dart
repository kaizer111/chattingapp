import 'package:flutter/material.dart';

class chats extends StatelessWidget {
  const chats({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ListTile(

          leading: CircleAvatar(
            child: Icon(Icons.account_box),   // instead of this icon this will be the persons profile picture
          ),
          title: Text('kaizer'),
          subtitle: Text('Latest chats'),
          trailing: Text('11:11'), // this will show the current time
        ),
        Divider(),
      ],
    );
  }
}