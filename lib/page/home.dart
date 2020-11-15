import 'package:amoresms/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:amoresms/views/listviewpesan.dart';
class Home extends StatefulWidget {
  Home(String phoneNumber, {Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          child: Icon(
            FlutterIcons.send_mco,
            size: 28,
          ),
          backgroundColor: bluePrimary.withOpacity(0.9),
          splashColor: Color(0xffD7E9FF),
        ),
        backgroundColor: bluePrimary,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              right: 0,
              child: Image.asset('assets/images/topbarhomeimages.png'),
            ),
            Positioned(
              top: size.height * 0.22,
              child: ListViewPesan(size: size),
            ),
          ],
        ),
      ),
    );
  }
}

