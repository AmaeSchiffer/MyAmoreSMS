import 'package:amoresms/components/topimages.dart';
import 'package:amoresms/page/home_screen/components/listviewpesan.dart';
import 'package:amoresms/util/size_config.dart';
import 'package:flutter/material.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          TopImages(
            right: 0,
            images: 'assets/images/topbarhomeimages.png',
          ),
          Positioned(
            top: SizeConfig.screenHeight * 0.22,
            child: ListViewPesan(),
          ),
        ],
      ),
    );
  }
}
