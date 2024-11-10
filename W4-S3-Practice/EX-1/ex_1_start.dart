 import 'package:flutter/material.dart';

class SelectButton extends StatefulWidget {
  const SelectButton({super.key});

  @override
  State<SelectButton> createState() => _SelectButtonState();
}

class _SelectButtonState extends State<SelectButton> {
  bool isSelected = false;

  String get buttonText => isSelected ? 'Selected' : 'Not Selected';
  Color get textColor => isSelected ? Colors.white : Colors.black;
  Color get backgroundColor => isSelected ? Colors.blue[500]! : Colors.blue[50]!;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 400,
        height: 100,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            textStyle: const TextStyle(fontSize: 20),
          ),
          onPressed: () {
            setState(() {
              isSelected = !isSelected;
            });
          },
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: const Text("Stateful Widget-Button"),
    ),
    body: Container(
      padding: const EdgeInsets.all(30),
      child:const Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: SelectButton(),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: SelectButton(),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: SelectButton(),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: SelectButton(),
          ),
        ],
      ),
    )
  ),
));