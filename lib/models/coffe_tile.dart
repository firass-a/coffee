// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class coffee extends StatelessWidget {
  late final String src;
  late final String price;
  late final String ml;
  late final String title;

  coffee(this.src, this.title, this.ml, this.price);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, bottom: 25, right: 15),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.black45, borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child:
                  Image.asset(src, width: 200, height: 200, fit: BoxFit.cover),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold, height: 2),
                    ),
                    Text(
                      ml,
                      style: TextStyle(color: Colors.grey, height: 2),
                    ),
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            price,
                            style: TextStyle(
                                height: 1.5,
                                fontSize: 18,
                                color: Colors.orange),
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Icon(
                                Icons.add,
                                size: 30,
                              ))
                        ],
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
