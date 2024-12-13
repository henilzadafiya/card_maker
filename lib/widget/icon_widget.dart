import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  late IconData icons;
  Color color;


  IconWidget({required this.icons, this.color = Colors.blueAccent});

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.keyboard_arrow_right_outlined,color: color,);
  }
}
