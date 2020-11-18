import 'package:amoresms/page/home_screen/components/body.dart';
import 'package:amoresms/page/home_screen/components/floacting_button.dart';
import 'package:amoresms/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:amoresms/util/size_config.dart';
class Home extends StatefulWidget {
  Home(String phoneNumber, {Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      floatingActionButton: FloactingActionButtonHome(),
      backgroundColor: bluePrimary,
      body: Body(),
    );
  }
}

