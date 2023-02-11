
import 'package:chattingapp/Constants/device_size.dart';
import 'package:chattingapp/Screens/editScreen.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: Text("Profile",
            style: TextStyle(
                color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold
            )
        ),
        centerTitle: true,
        //backgroundColor: Color.fromARGB(255, 145, 193, 232),
        backgroundColor: Colors.blue,
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
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/jimin.jpg'),
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
                    onPressed: (){
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => EditScreen()));
                    },
                    child: Text('Edit Profile',
                      style: TextStyle(fontSize: 19,
                        color: Colors.white
                      ),
                    ),
                    color: Colors.black,
                    shape: StadiumBorder(),
                  ),
                ),

                SizedBox(
                  height: displayHeight(context)*0.017,
                ),
                const Divider(),

                ListTile(
                  leading: Icon(Icons.cake,size: 37,),
                  title: Text('Birthday',
                    style: TextStyle(color: Colors.black,
                        fontSize: 16,
                    ),
                  ),
                  subtitle: Text('13/08/1994',
                    style: TextStyle(color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),

                ListTile(
                  leading: Icon(Icons.boy,size: 48,),
                  title: Text('Gender',
                    style: TextStyle(color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text('Male',
                    style: TextStyle(color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),

                ListTile(
                  leading: Icon(Icons.phone,size: 39,),
                  title: Text('Email',
                    style: TextStyle(color: Colors.black,
                        fontSize: 16,
                    ),
                  ),
                  subtitle: Text('abc123@gmail.com',
                    style: TextStyle(color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
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
