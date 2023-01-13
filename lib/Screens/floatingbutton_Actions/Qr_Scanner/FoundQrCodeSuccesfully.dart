import 'dart:math';
import 'package:chattingapp/Constants/device_size.dart';
import 'package:chattingapp/model/User_model.dart';
import 'package:chattingapp/services/api/utils.dart';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';


class FoundCodeScreen extends StatefulWidget {
  final String value;
  final Function() screenClosed;
  const FoundCodeScreen({
    Key? key,
    required this.value,
    required this.screenClosed,
  }) : super(key: key);

  @override
  State<FoundCodeScreen> createState() => _FoundCodeScreenState();
}

class _FoundCodeScreenState extends State<FoundCodeScreen> {
   late ConfettiController _controllerCenter;

    @override
  void initState() {
    super.initState();
    _controllerCenter = ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenter.play();
  }

  //  void dispose() {
  //   _controllerCenter.dispose();
  //   _controllerCenterRight.dispose();
  //   _controllerCenterLeft.dispose();
  //   _controllerTopCenter.dispose();
  //   _controllerBottomCenter.dispose();
  //   super.dispose();
  // }


  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      // appBar: AppBar(
      //   title: Text("Found Code"),
      //   centerTitle: true,
      //   leading: IconButton(
      //     onPressed: () {
      //       widget.screenClosed();
      //       Navigator.pop(context);
      //     },
      //     icon: Icon(Icons.arrow_back_outlined,),
      //   ),
      // ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: ConfettiWidget(
              confettiController: _controllerCenter,
              blastDirectionality: BlastDirectionality
                  .explosive, // don't specify a direction, blast randomly
              shouldLoop:
                  true, // start again as soon as the animation is finished
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple,
              ], // manually specify the colors to be used
              createParticlePath: drawStar, // define a custom shape/path.
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Image.asset("assets/images/hand-shake.png",height: 230,width: 230,),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Text("Congratulations!!! ",style: TextStyle(fontSize: 26,fontFamily: "fira",color: Colors.white),),
          ),
          SizedBox(
            height: 35,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Scanned User", style: TextStyle(fontSize: 45,fontFamily: "fira",color: Colors.white),),
                  SizedBox(height: 20,),
                  FutureBuilder(
                    future: getUserDetails(widget.value),
                    builder: (context,AsyncSnapshot<UserModel> snapshot) {
                      if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
                        return Container(
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 2,color: Colors.white))
                      ),
                      child: Text(snapshot.data!.name, style: TextStyle(fontSize: 16,color: Colors.white),));
                      }
                      else{
                        return CircularProgressIndicator();
                      }
                    },
                  
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 8, 30, 0),
            child: Text("* By Clicking on below button you ensure that the other user can see your profile picture and few other details",style: TextStyle(color: Colors.white,fontFamily: "fira")),
          ),
          SizedBox(
            height: 25,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                height: displayHeight(context) * 0.055,
                color: Colors.blue[100],
                child: Text("Create Chatroom",style: TextStyle(
                            fontSize: 19,)),
                onPressed: () {
                
              },),
            ),
          )
        ],
      ),
    );
  }

   Text _display(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white, fontSize: 20),
    );
  }

}