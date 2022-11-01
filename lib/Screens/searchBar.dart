import 'package:chattingapp/Constants/device_size.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: 60,
      width: displayWidth(context)*0.9,
      child: TextFormField(
        decoration: InputDecoration(
            //contentPadding: EdgeInsets.zero,
            prefixIcon: Icon(Icons.search,
              size: 35,
            ),
            hintText: 'Search..',
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(
              width: 3.0,
              color: Colors.grey,
            ),
              borderRadius: BorderRadius.circular(10),


            ),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(
              width: 3.0,
              color: Colors.grey,
            ),
              borderRadius: BorderRadius.circular(10),
            )

        ),
      ),
    );
  }
}