import 'package:amoresms/util/size_config.dart';
import 'package:flutter/material.dart';

class WhiteBoxRadius extends StatelessWidget {
  final Widget content;
  final double height, width;
  const WhiteBoxRadius({@required this.content, Key key, this.height, this.width}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: height,
        margin : EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(8)),
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
