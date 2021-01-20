import 'package:flutter/material.dart';

class Chooselanguage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Scaffold(
          backgroundColor: Colors.white,

          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bg.png"),
                fit: BoxFit.cover,
              ),
            ), /* add child content here */
          ),
        ),
      ),
    );
  }
  
}