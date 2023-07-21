// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:matcher/matcher.dart';
import 'package:coffee/models/leading.dart';

class infos extends StatefulWidget {
  const infos({super.key});

  @override
  State<infos> createState() => _infosState();
}

class _infosState extends State<infos> {
  int cpt = 0;
  int price = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black45,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              height: 350,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(15),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  "lib/assets/images/Coffee.jpg",
                  fit: BoxFit.cover,
                  // Adjust the height of the image as needed
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Cappucino Latte",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Desription",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "A cappucino is an espresso-based coffe \ndrink that originated in Austria with later\ndevelopment taking place in Italy,and is\nprepared with steamed milk team",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    wordSpacing: 2,
                    height: 1.5),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Quantity",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    width: 100,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          icon(Icon(Icons.remove), () {
                            setState(() {
                              if (cpt > 0 && price > 0) {
                                cpt--;
                                price -= 20;
                              }
                            });
                          }),
                          Text(
                            cpt.toString(),
                            style:
                                TextStyle(fontSize: 25, color: Colors.orange),
                          ),
                          icon(Icon(Icons.add), () {
                            setState(() {
                              cpt++;
                              price += 20;
                            });
                          }),
                        ],
                      ),
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                        text: "\$ ",
                        style: TextStyle(fontSize: 20, color: Colors.orange),
                        children: [
                          TextSpan(
                              text: "$price",
                              style:
                                  TextStyle(fontSize: 35, color: Colors.orange))
                        ]),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[850]),
                      child: Icon(
                        Icons.favorite_outline,
                        color: Colors.orange,
                        size: 35,
                      ),
                    ),
                    Container(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Add to card",
                            style: TextStyle(fontSize: 20),
                          )),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class icon extends StatelessWidget {
  final Icon tpe;
  final Function tap;
  @override
  icon(this.tpe, this.tap);
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => tap(),
      child: Icon(
        tpe.icon,
        size: 25,
        color: Colors.orange,
      ),
    );
  }
}
