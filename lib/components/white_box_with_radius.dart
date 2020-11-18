import 'package:amoresms/util/size_config.dart';
import 'package:flutter/material.dart';

class WhiteBoxRadius extends StatelessWidget {
  final Widget content;
  const WhiteBoxRadius({@required this.content, Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
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
