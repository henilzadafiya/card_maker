import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerWidget extends StatefulWidget {
  Color? color;
  EdgeInsetsGeometry? margin;
  ContainerWidget({this.color,this.margin});

  @override
  State<ContainerWidget> createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: widget.margin ??EdgeInsets.all(5),
      height: 60,
      // width: 50,
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.yellow),
          color:  widget.color ?? Colors.transparent),
    );
  }
}

Widget buildContainer({Color? color, String? label, EdgeInsetsGeometry ? margin}) {
  return Container(
    alignment: Alignment.center,
    margin: margin ??EdgeInsets.all(5),
    height: 60,
    // width: 50,
    decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.yellow),
        color:  color ?? Colors.transparent),
  );
}