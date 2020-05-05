import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DebugWidget extends StatelessWidget{

  DebugWidget({
    @required this.child,
    this.color: Colors.red,
    this.width: 1.0
  });

  final Color color;
  final double width;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
          border: Border.all(color: this.color, width: this.width)
      ),
    );
  }
}