import 'package:chattingapp/Constants/device_size.dart';
import 'package:chattingapp/searchBar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade50,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Whatsagram',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/jimin.jpg'),
                        radius: 25,
                      )
                    ],
                  ),
                  SizedBox(
                    height: displayHeight(context)*0.03,
                  ),
                  SearchBar(
                  ),
                ],
              ),
            ),


            Positioned(
              bottom: 0,
                child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              elevation: 20,
              child: Container(
                height: displayHeight(context) * 0.68,
                width: displayWidth(context),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
