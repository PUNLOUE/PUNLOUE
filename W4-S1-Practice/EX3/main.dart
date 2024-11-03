import 'package:flutter/material.dart';

enum Type {
  Primary,
  Secondary,
  Disabled,
}

final Map<Type, Color> buttonType = {
  Type.Primary: Colors.blue,
  Type.Secondary: Colors.green,
  Type.Disabled: Colors.grey,
};
enum IconPosition{
  before, 
  after,
}
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Products' , style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        body: const Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomButton(title: "Submit", icon: Icons.check, type: Type.Primary),
              CustomButton(title: "Time", icon: Icons.access_alarm, type: Type.Secondary, iconPosition: IconPosition.after,),
              CustomButton(title: "Account", icon: Icons.contact_emergency_sharp, type: Type.Disabled, iconPosition: IconPosition.after),
            ],
          ),
        ),
      ),
    ),
  );
}

class CustomButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Type type;
  final IconPosition iconPosition;

  const CustomButton({
    super.key,
    required this.title,
    required this.icon,
    this.type = Type.Primary,
    this.iconPosition = IconPosition.before,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        color: buttonType[type], // Retrieve color based on the type
      ),
      margin: const EdgeInsets.all(10),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: _buildButtonChildren(),
        ),
      ),
    );
  }

  List<Widget> _buildButtonChildren() {
    List<Widget> children = [];

    if (iconPosition == IconPosition.before) {
      children.add(
        Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(
            icon,
            color: Colors.white,
            size: 20.0,
          ),
        ),
      );
    }

    children.add(
      Text(
        title,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );

    if (iconPosition == IconPosition.after) {
      children.add(
        Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(
            icon,
            color: Colors.white,
            size: 20.0,
          ),
        ),
      );
    }

    return children;
  }
}