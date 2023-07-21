// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class leading extends StatelessWidget {
  const leading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(1, 1),
      child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black45),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 13),
            child: Icon(
              Icons.arrow_back_ios,
              size: 20,
            ),
          )),
    );
  }
}
