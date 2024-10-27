 import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            CustomCard(text: "OOP", color: Colors.pinkAccent),
            CustomCard(text: "DART", color: Colors.pink),
            CustomCard(text: "FLUTTER", color: Colors.redAccent),
          ],
        ),
      ),
    ),
  );
}

class CustomCard extends StatelessWidget {
  final String text;
  final Color color;

  const CustomCard({
    super.key,
    required this.text,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),

      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(650, 0, 650, 0),
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: color,
            ),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 35,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}