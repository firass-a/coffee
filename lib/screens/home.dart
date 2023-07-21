// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';
import 'package:coffee/models/coffe_manager.dart';
import 'package:flutter/material.dart';
import 'package:coffee/models/coffe_tile.dart';
import 'package:coffee/models/coffe_type.dart';
import 'package:coffee/screens/infos.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final CoffeeManager coffeeManager = CoffeeManager();
  bool pressed = false;
  late FocusNode blurryNode;
  late FocusNode original;

  @override
  void initState() {
    super.initState();
    original = FocusNode();
    blurryNode = FocusNode();
  }

/*
  @override
  void dispose() {
    original.dispose();
    blurryNode.dispose();
    super.dispose();
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Icon(
          Icons.menu,
          size: 30,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.person,
              size: 30,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "")
      ]),
      body: Stack(children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text.rich(
                  TextSpan(
                    text: "Find your favorite\n",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: "coffee",
                          style: TextStyle(
                              height: 1.5,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange)),
                      TextSpan(
                        text: " with Jual Kopi",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                focusNode: original,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.orange,
                  ),
                  hintText: "Find your favorite coffee",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onTap: () {
                  setState(() {
                    pressed = true;
                    original.unfocus();
                  });
                },
                onSubmitted: (value) {
                  setState(() {
                    pressed = false;
                  });
                },
              ),
            ),
            SizedBox(
              height: 60,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: ListView.builder(
                  itemCount: coffeeManager.coffeeType.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return CoffeType(coffeeManager.coffeeType[index][0],
                        coffeeManager.coffeeType[index][1], () {
                      // tap on an icon to change the coffe type
                      setState(() {
                        coffeeManager.coffeSelection(index);
                      });
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>infos()));
                      });
                    },
                    child: coffee("lib/assets/images/Coffee.jpg", "Cappucino Latte",
                        "180ml", "\$ 3.0"),
                  ),
                  coffee("lib/assets/images/Espresso.jpg", "Espresso", "100ml",
                      "\$ 5.0"),
                  coffee("lib/assets/images/Moccacino.jpg", "Moccacino",
                      "200ml", "\$ 8.0"),
                ],
              ),
            ),
          ],
        ),
        if (pressed)
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                    focusNode: blurryNode,
                    autofocus: true,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.orange,
                      ),
                      hintText: "Find your favorite coffee",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        pressed = true;
                      });
                    },
                    onSubmitted: (value) => setState(() {
                          pressed = false;
                        })),
              ),
            ),
          ),
      ]),
    );
  }
}
