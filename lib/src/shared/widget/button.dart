// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SButton extends StatelessWidget {
  
 final VoidCallback onTapped;
 final String slabel;

 SButton({required this.onTapped, required this.slabel});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
    Icon(
      Icons.check,
      size: 50,
    ),
    Text(slabel,),
    SizedBox(
      height: 30,
    ),
    GestureDetector(
      onTap: onTapped,
      child: Container(
        width: 150,
        height: 70,
        child: Center(
          child: Text(
            'Go Back',
            style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(30)),
      ),
    ),
          ],
        ));
  }}

  class LabelButton extends StatelessWidget {

  final Color colour;
  final String labelText;
  final Color cStyle;

  LabelButton({required this.colour, required this.labelText, required this.cStyle});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: 900,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: colour,
      ),
      child: Center(
          child: Text(
            labelText,
              style: TextStyle(
                  color: cStyle,
                  fontSize: 20,
                  fontWeight: FontWeight.bold))),
    );
  }
}
