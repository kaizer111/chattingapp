import 'package:flutter/material.dart';

class calls extends StatelessWidget {
  const calls({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children:  [
        Expanded(
          child: ListView.builder(
            itemCount: 10,
        
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return  ListTile(
                tileColor: Colors.white,
              visualDensity: const VisualDensity(vertical: 2.5),
              leading: const CircleAvatar(
                child: Icon(Icons.account_box),   // instead of this icon this will be the persons profile picture
              ),
              title: const Text('kaizer'),
              subtitle: Row(
                  children: [
                    Icon(Icons.call),
                    Text('5:30 min'),
                  ],
              ),
              trailing: const Text('11:11'), // this will show the current time
            );
            },
          ),
        ),
      ],
    );;
  }
}