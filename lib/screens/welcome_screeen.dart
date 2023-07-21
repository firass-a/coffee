// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:coffee/screens/home.dart';

class WelcomPage extends StatefulWidget {
  const WelcomPage({Key? key}) : super(key: key);

  @override
  State<WelcomPage> createState() => _WelcomPageState();
}

class _WelcomPageState extends State<WelcomPage> {
  late int curpos = 0;
  final _controller = PageController();
  final images = [
    "lib/assets/images/manycoff.jpg",
    "lib/assets/images/brown.jpg",
    "lib/assets/images/coffees.jpg",
  ];
  final text = [
    "Jual Kopi",
    "Enjoy\nour Espresso",
    "Lets start !",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: images.length,
            onPageChanged: (index) {
              setState(() {
                curpos = index;
              });
            },
            itemBuilder: (context, index) {
              return Image.asset(
                images[index],
                fit: BoxFit.cover,
              );
            },
          ),
          Align(
            alignment: Alignment(0, 0.95),
            child: SmoothPageIndicator(
              effect: ExpandingDotsEffect(
                dotColor: Colors.grey,
                dotWidth: 10,
                dotHeight: 5,
                activeDotColor: Colors.orange,
              ),
              controller: _controller,
              count: 3,
            ),
          ),
          Align(
            alignment: Alignment(0.9, -0.8),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => home()));
                });
              },
              child: Container(
                width: 100,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.grey[600],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Get started ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (curpos == 0)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 90, vertical: 140),
              child: Column(children: [
                Text(
                  text[curpos],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.white),
                ),
                Text(
                  "Buy the best coffee from us",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ]),
            ),
          if (curpos == 1)
            Align(
              alignment: Alignment(0.7, 0.5),
              child: Text(
                text[curpos],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                    color: Colors.white),
              ),
            ),
          if (curpos == 2)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 120),
              child: Column(children: [
                Text(
                  text[curpos],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                      color: Colors.white),
                ),
              ]),
            ),
        ],
      ),
    );
  }
}
