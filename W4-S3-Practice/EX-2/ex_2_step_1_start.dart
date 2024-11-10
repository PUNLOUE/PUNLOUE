 import 'package:flutter/material.dart';
class ManageCard extends StatefulWidget {
  const ManageCard({super.key});

  @override
  State<ManageCard> createState() => _ManageCardState();
  }

class _ManageCardState extends State<ManageCard> {
  bool isFavorite = false;
  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: .5, color: Colors.grey),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Expanded(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'title',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w800),
                        ),
                        SizedBox(height: 10.0),
                        Text('description')
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: toggleFavorite,
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.grey,
                      ))
                ],
              ),
            )
          ],
        );
  }
}
void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Favorite cards"),
        ),
        body:const Column(
          children: [
            ManageCard(),
            ManageCard(),
            ManageCard(),
            ManageCard(),
          ],
        )
      ),
    ));