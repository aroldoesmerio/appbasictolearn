import 'package:flutter/material.dart';

class Mybody extends StatefulWidget {
  @override
  _MybodyState createState() => _MybodyState();
}

class _MybodyState extends State<Mybody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 80,
          color: Colors.amber,
        ),
      ),
    ); 
  }
}