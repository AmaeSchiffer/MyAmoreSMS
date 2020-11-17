import 'package:amoresms/components/topimages.dart';
import 'package:amoresms/page/create_pesan.dart';
import 'package:amoresms/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:amoresms/views/listviewpesan.dart';
import 'package:get/get.dart';

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
          onPressed: () async {
            Get.to(CreatePesan());
          },
          child: Icon(
            FlutterIcons.message_mco,
            size: 28,
          ),
          backgroundColor: bluePrimary.withOpacity(0.9),
          splashColor: Color(0xffD7E9FF),
        ),
        backgroundColor: bluePrimary,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            TopImages(
              right: 0,
              images: 'assets/images/topbarhomeimages.png',
            ),
            Positioned(
              top: size.height * 0.22,
              child: ListViewPesan(),
            ),
          ],
        ),
      ),
    );
  }
}
