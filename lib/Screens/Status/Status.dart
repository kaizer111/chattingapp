import 'package:chattingapp/Dummy_data/data.dart';
import 'package:chattingapp/Screens/Status/display_status.dart';
import 'package:flutter/material.dart';

import '../../Constants/device_size.dart';

class Status extends StatelessWidget {
  const Status({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(

      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: CircleAvatar(
            child: IconButton(
              onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const DisplayStatus(),));
            }, icon: const Icon(Icons.account_box)),
            //backgroundImage: AssetImage(statuslist[index].image,),
            radius: 40,
          ),
        );
      },
      itemCount: 10,
    );
  }
}
