 import 'package:flutter/material.dart';

void main() {
  runApp(
     MaterialApp(
      home: Container(
        padding: const EdgeInsets.all(50),
        child: Column(
        
          children: [
            
                        Container(
              padding:const EdgeInsets.fromLTRB(650, 0, 650, 0),
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              decoration: BoxDecoration(
                borderRadius:  BorderRadius.circular(35),
                color: Colors.blue[100]
              ),
              child: const Text(
                "OOP",
                style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none),
              ),
            ),
            Container(
              padding:const EdgeInsets.fromLTRB(640, 0, 640, 0),
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              decoration: BoxDecoration(
                borderRadius:  BorderRadius.circular(35),
                color: Colors.blue[300],
              ),
              child: const Text(
                "DART",
                style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none),
              ),
            ),
             Container(
              padding:const EdgeInsets.fromLTRB(600, 0, 600, 0),
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              decoration: BoxDecoration(
                borderRadius:  BorderRadius.circular(35),
              gradient: const LinearGradient(colors: [
                Color(0xff64b5f6),Color(0xff1e88e5)
              ])
              ),
              child: const Text(
                "FLUTTER",
                style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none),
              ),
            )],
        ),
        
      ),
    ),
  );
}