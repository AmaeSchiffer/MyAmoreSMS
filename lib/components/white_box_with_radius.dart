import 'package:flutter/material.dart';

class WhiteBoxRadius extends StatelessWidget {
  const WhiteBoxRadius({@required this.size, @required this.height, @required this.content, Key key}) : super(key: key);
  final Size size;
  final double height;
  final Widget content;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 40,
      child: Container(
        height: size.height * height,
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: content,
      ),
    );
  }
}
