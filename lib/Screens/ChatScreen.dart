import 'package:chattingapp/Constants/device_size.dart';
import 'package:flutter/material.dart';

class Chatscreen extends StatelessWidget {
  const Chatscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Chats',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
              ),
              Text('Groups',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
              ),
              Text('Calls',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
              ),
            ],
          ),
          Divider(thickness: 4,),

          SizedBox(
            height: displayHeight(context)*0.015,
          ),

          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/Parkshin.jpg'),
                radius: 25,
              ),
              SizedBox(
                width: displayWidth(context)*0.04,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Park Shin Hye',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                  ),

                  SizedBox(
                  height: displayHeight(context)*0.01,
                  ),

                  Row(
                    children: [
                      Text('Anneyonghaseyo!!!',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18
                        ),
                      ),

                      SizedBox(
                        width: displayWidth(context)*0.23,
                      ),

                      Text('4:52 pm')
                    ],
                  ),
                 ],
               ),
            ],
          ),
          SizedBox(
            height: displayHeight(context)*0.015,
          ),

          Divider(thickness: 6,),

          SizedBox(
            height: displayHeight(context)*0.015,
          ),


          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/Parkshin.jpg'),
                radius: 25,
              ),
              SizedBox(
                width: displayWidth(context)*0.04,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Park Shin Hye',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                  ),

                  SizedBox(
                    height: displayHeight(context)*0.01,
                  ),

                  Row(
                    children: [
                      Text('Anneyonghaseyo!!!',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18
                        ),
                      ),

                      SizedBox(
                        width: displayWidth(context)*0.23,
                      ),

                      Text('4:52 pm')
                    ],
                  ),
                ],
              ),
            ],
          ),

          SizedBox(
            height: displayHeight(context)*0.015,
          ),

          Divider(thickness: 6,),

          SizedBox(
            height: displayHeight(context)*0.015,
          ),

          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/Parkshin.jpg'),
                radius: 25,
              ),
              SizedBox(
                width: displayWidth(context)*0.04,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Park Shin Hye',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                  ),

                  SizedBox(
                    height: displayHeight(context)*0.01,
                  ),

                  Row(
                    children: [
                      Text('Anneyonghaseyo!!!',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18
                        ),
                      ),

                      SizedBox(
                        width: displayWidth(context)*0.23,
                      ),

                      Text('4:52 pm')
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: displayHeight(context)*0.015,
          ),

          Divider(thickness: 6,),

          SizedBox(
            height: displayHeight(context)*0.015,
          ),

          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/Parkshin.jpg'),
                radius: 25,
              ),
              SizedBox(
                width: displayWidth(context)*0.04,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Park Shin Hye',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                  ),

                  SizedBox(
                    height: displayHeight(context)*0.01,
                  ),

                  Row(
                    children: [
                      Text('Anneyonghaseyo!!!',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18
                        ),
                      ),

                      SizedBox(
                        width: displayWidth(context)*0.23,
                      ),

                      Text('4:52 pm')
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: displayHeight(context)*0.015,
          ),

          Divider(thickness: 6,),

          SizedBox(
            height: displayHeight(context)*0.015,
          ),

          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/Parkshin.jpg'),
                radius: 25,
              ),
              SizedBox(
                width: displayWidth(context)*0.04,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Park Shin Hye',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                  ),

                  SizedBox(
                    height: displayHeight(context)*0.01,
                  ),

                  Row(
                    children: [
                      Text('Anneyonghaseyo!!!',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18
                        ),
                      ),

                      SizedBox(
                        width: displayWidth(context)*0.23,
                      ),

                      Text('4:52 pm')
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: displayHeight(context)*0.015,
          ),

          Divider(thickness: 6,),

          SizedBox(
            height: displayHeight(context)*0.015,
          ),

          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/Parkshin.jpg'),
                radius: 25,
              ),
              SizedBox(
                width: displayWidth(context)*0.04,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Park Shin Hye',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                  ),

                  SizedBox(
                    height: displayHeight(context)*0.01,
                  ),

                  Row(
                    children: [
                      Text('Anneyonghaseyo!!!',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18
                        ),
                      ),

                      SizedBox(
                        width: displayWidth(context)*0.23,
                      ),

                      Text('4:52 pm')
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: displayHeight(context)*0.015,
          ),

          Divider(thickness: 6,),

          SizedBox(
            height: displayHeight(context)*0.015,
          ),


        ],
      ),
    );

  }
}
