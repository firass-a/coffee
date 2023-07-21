import 'package:flutter/material.dart';
import 'package:coffee/constants/styles.dart';

class CoffeType extends StatelessWidget {
  late final String coftype;
  late bool checked;
  late final Function ontap;
  CoffeType(this.coftype, this.checked, this.ontap);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: GestureDetector(
        onTap: () => ontap(),
        child: Text(
          coftype,
          style:  TextStyle(
            color: checked? Colors.orange:Colors.white
            , 
            fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
