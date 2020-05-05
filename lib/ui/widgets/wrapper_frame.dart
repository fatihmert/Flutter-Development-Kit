import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WrapperFrame extends StatelessWidget{

  WrapperFrame({
    @required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: child,
    );
  }
}