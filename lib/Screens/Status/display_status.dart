import 'package:flutter/material.dart';

class DisplayStatus extends StatelessWidget {
  const DisplayStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        leading: IconButton(onPressed:  () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),
        
      ),
    );
  }
}