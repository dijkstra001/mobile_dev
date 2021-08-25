import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("I am Poor"),
          backgroundColor: Colors.deepPurple[500],
        ),
        backgroundColor: Colors.deepPurple[200],
        body: Center(
          child: Image(
            image: AssetImage('images/img_main.jpg'),
          ),
        ),
      ),
    ),
  );
}
