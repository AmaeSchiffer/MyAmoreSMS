import 'package:amoresms/components/back_button.dart';
import 'package:amoresms/components/text_component.dart';
import 'package:amoresms/components/topimages.dart';
import 'package:amoresms/components/white_box_with_radius.dart';
import 'package:amoresms/model/pesan_model.dart';
import 'package:amoresms/views/content_of_detailpesan.dart';
import 'package:amoresms/views/listviewpesan.dart';
import 'package:flutter/material.dart';
import 'package:amoresms/util/constants.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

String phoneNumber;

class Detail extends StatefulWidget {
  final List<Penerima> detailPesan;
  final String pesan;
  Detail({@required this.detailPesan, @required this.pesan, Key key})
      : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: bluePrimary,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            TopImages(
              images: 'assets/images/detailpesantopimages.png',
              right: 0,
            ),
            Positioned(
              left: 5,
              child: BackBtn(),
            ),
            Positioned(
              left: 17,
              top: 48,
              child: Container(
                height: size.height * 0.165,
                width: size.width * 0.81,
                decoration: BoxDecoration(
                  color: white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: bluePrimary,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 12.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(
                      "${widget.pesan}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.25,
              child: Container(
                height: size.height * 0.77,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: ContentOfDetailPesan(
                  detailPesan: widget.detailPesan,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
