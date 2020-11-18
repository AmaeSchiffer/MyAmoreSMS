import 'package:amoresms/page/inputphonenumber_screen/input_numberphone.dart';
import 'package:amoresms/util/constants.dart';
import 'package:amoresms/util/size_config.dart';
import 'package:animator/animator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key key}) : super(key: key);
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        children: <Widget>[
          Container(
            color: white,
            height: SizeConfig.screenHeight * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Animator<double>(
                  curve: Curves.easeInOut,
                  duration: Duration(seconds: 2),
                  tween: Tween<double>(begin: 0, end: SizeConfig.screenWidth * 0.8),
                  builder: (context, animatorState, child) => Center(
                    child: Container(
                      height: animatorState.value * 0.5,
                      width: animatorState.value * 0.5,
                      decoration: BoxDecoration(
                        color: bluePrimary,
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      child: Image.asset('assets/images/logoamoresms.png'),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  "Amore SMS",
                  style: TextStyle(
                    fontSize: 16,
                    color: bluePrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Lebih mudah berbagi pesan",
                  style: TextStyle(
                    fontSize: 16,
                    color: bluePrimary,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: SizeConfig.screenHeight * 0.5,
            width: SizeConfig.screenWidth,
            decoration: BoxDecoration(
              color: bluePrimary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(104.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: IconButton(
                    onPressed: () {
                      Get.to(InputPhoneNumber());
                    },
                    splashColor: black,
                    icon: Icon(FlutterIcons.arrow_right_circle_mco),
                    iconSize: 95,
                    color: white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
