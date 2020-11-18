import 'dart:async';

import 'package:amoresms/page/home_screen/home.dart';
import 'package:amoresms/page/landing_screen/landingpage.dart';
import 'package:amoresms/util/constants.dart';
import 'package:amoresms/util/size_config.dart';
import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

String phoneNumber;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home("089602716401"),
    );
  }
}

class MainSplashScreen extends StatefulWidget {
  MainSplashScreen({Key key}) : super(key: key);

  @override
  _MainSplashScreenState createState() => _MainSplashScreenState();
}

class _MainSplashScreenState extends State<MainSplashScreen> {
  @override
  void initState() {
    super.initState();
    checkUserLogged().whenComplete(() async {
      Timer(Duration(seconds: 2), () {
        if (phoneNumber != null) {
          Get.offAll(Home(phoneNumber));
        } else {
          Get.off(LandingPage());
        }
      });
    });
  }

  Future checkUserLogged() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var obtainPhoneNumber = prefs.getString('userKey');
    setState(() {
      phoneNumber = obtainPhoneNumber;
    });
    print(phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: bluePrimary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Animator<double>(
                curve: Curves.fastLinearToSlowEaseIn,
                duration: Duration(seconds: 5),
                tween: Tween<double>(begin: 0, end: SizeConfig.screenWidth * 0.8),
                builder: (context, animatorState, child) => Center(
                  child: Container(
                    height: animatorState.value,
                    width: animatorState.value,
                    child: Image.asset('assets/images/logoamoresms.png'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
