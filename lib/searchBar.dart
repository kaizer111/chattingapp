import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 350,
      child: TextFormField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,   //NOTE: for putting hint text in center
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