
import 'package:flutter/material.dart';
import 'package:amoresms/model/detail_pesan.dart';
import 'package:amoresms/util/constants.dart';
import 'package:flutter_icons/flutter_icons.dart';
class Detail extends StatefulWidget {
  final DetailPesan pesan;
  Detail(List<Map<String, dynamic>> detailPesan, {this.pesan,Key key}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
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
            Positioned(
              right: 0,
              child: Image.asset('assets/images/detailpesantopimages.png'),
            ),
            Positioned(
              top: size.height * 0.25,
              child: Material(
                color: Colors.transparent,
                elevation: 40,
                child: Container(
                  height: size.height * 0.75,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}