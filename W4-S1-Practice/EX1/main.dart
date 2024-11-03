import 'package:flutter/material.dart';


void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
        title: const Text('My Hobbies!'),
        
        ),
        body: const Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            
            children: [
              HobbyCard(
                title: 'Travelling',
                icon: Icons.travel_explore,
                bgColor: Color.fromARGB(255, 34, 255, 233),
              ),
              SizedBox(height: 10,),
              HobbyCard(
                title: 'Skating',
                icon: Icons.skateboarding_rounded,
                bgColor: Color.fromARGB(255, 67, 64, 255),
              ),
              SizedBox(height: 10,),
              HobbyCard(
                title: 'Reading',
                icon: Icons.book,
                
              )
            ],
          ),
        ),
      ),
    ),
  );
}

class HobbyCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color bgColor;

  const HobbyCard({
    super.key,
    required this.title,
    required this.icon,
    this.bgColor = Colors.blue,

  });
   


  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(15)
        ),
      ),
      padding: const EdgeInsets.all(17.0),
      
      child:  Center(
        child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
              ),
            
            ],
          ),
      )
    
    );
  }
}
