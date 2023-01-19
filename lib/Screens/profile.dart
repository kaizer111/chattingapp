
import 'package:chattingapp/Constants/device_size.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile",
            style: TextStyle(
                color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold
            )
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 145, 193, 232),
      ),

      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height:displayHeight(context)*0.17,
                  width:displayWidth(context)*0.31,
                  child: CircleAvatar(backgroundColor: Colors.green,
                    radius: 50,
                  ),
                ),
                SizedBox(
                  height: displayHeight(context)*0.01,
                ),
                Text('Park Jimin',
                  style: TextStyle(fontSize: 22,
                  fontWeight: FontWeight.w500),
                ),

                SizedBox(
                  height: displayHeight(context)*0.01,
                ),
                Text('Hii, I am Park Jimin',
                  style: TextStyle(fontSize: 20,
                      //fontWeight: FontWeight.w500
                    ),
                ),

                SizedBox(
                  height: displayHeight(context)*0.017,
                ),
                SizedBox(
                  height: displayHeight(context)*0.06,
                  width: displayWidth(context)*0.5,
                  child: MaterialButton(
                    onPressed: (){},
                    child: Text('Edit Profile',
                      style: TextStyle(fontSize: 19,
                        color: Colors.white
                      ),
                    ),
                    color: Colors.blue[700],
                    shape: StadiumBorder(),
                  ),
                ),

                SizedBox(
                  height: displayHeight(context)*0.017,
                ),
                const Divider(),

                SizedBox(
                  height: displayHeight(context)*0.017,
                ),

                SizedBox(
                  child: Expanded(
                    child: ListTile(
                      leading: Container(
                        height: double.infinity,
                        width: 300,
                        child: Column(
                          children: [
                                          
                            Row(
                              children: [
                                Icon(Icons.cake,size: 34,color: Colors.black,),
                                SizedBox(
                                  width: displayWidth(context)*0.03,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Date Of Birth',
                                      style: TextStyle(fontSize: 20,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    SizedBox(
                                      height: displayHeight(context)*0.005,
                                    ),
                                          
                                    Text('13/10/1995',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                                          
                                          
                            SizedBox(
                              height: displayHeight(context)*0.005,
                            ),
                                          
                            const Divider(),
                                          
                                          
                            Row(
                              children: [
                                Icon(Icons.account_circle,size: 34,color: Colors.black,),
                                SizedBox(
                                  width: displayWidth(context)*0.03,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Gender',
                                      style: TextStyle(fontSize: 20,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    SizedBox(
                                      height: displayHeight(context)*0.005,
                                    ),
                                          
                                    Text('Male',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                                          
                                          
                            SizedBox(
                              height: displayHeight(context)*0.005,
                            ),
                                          
                            const Divider(),
                                          
                            Row(
                              children: [
                                Icon(Icons.email,size: 34,color: Colors.black,),
                                SizedBox(
                                  width: displayWidth(context)*0.03,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Email',
                                      style: TextStyle(fontSize: 20,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    SizedBox(
                                      height: displayHeight(context)*0.005,
                                    ),
                                          
                                    Text('mochi1310@gmail.com',
                                      style: TextStyle(fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                                          
                            SizedBox(
                              height: displayHeight(context)*0.017,
                            ),
                            SizedBox(
                              height: displayHeight(context)*0.017,
                            ),
                            const Divider(),
                            Row(
                              children: [
                                Icon(Icons.logout_outlined,size: 34,color: Colors.black,),
                                SizedBox(
                                  width: displayWidth(context)*0.03,
                                ),
                                Text('Log Out',
                                  style: TextStyle(fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
