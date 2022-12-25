import 'package:flutter/material.dart';

class StarredMessage extends StatelessWidget {
  const StarredMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Starred Messages')),
    );
  }
}
