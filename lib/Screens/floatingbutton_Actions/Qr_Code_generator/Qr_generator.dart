import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrGenerator extends StatelessWidget {
   QrGenerator({super.key});
  String data= "vishal";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back,color: Colors.black,)),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          // const SizedBox(
          //   height: 30,
          // ),
          Center(
            child: CircleAvatar(
              child: Container(child: Image.asset("assets/images/chatting.png",fit: BoxFit.contain,)),
              backgroundColor: Colors.blue[200],
              radius: 45,
            )),
            const SizedBox(
              height: 15,
            ),
            const Center(child: Text("Kakashi Hatake",style: TextStyle(fontSize: 25,fontFamily: "fira"),)),
            const SizedBox(
            height: 30,
          ),
          Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.blue,
              backgroundBlendMode: BlendMode.colorBurn,
              borderRadius: BorderRadius.circular(15)
            ),
            child: Center(
              child: QrImage(
                data: data,
                backgroundColor: Colors.white,
                size: 200,
                ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          MaterialButton(
            color: Colors.blue[200],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: const Icon(Icons.share),
            onPressed: () {
            
          },)
        ],
      ),
    );
  }
}