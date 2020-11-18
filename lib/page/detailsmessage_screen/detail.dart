import 'package:amoresms/components/back_button.dart';
import 'package:amoresms/components/topimages.dart';
import 'package:amoresms/components/white_box_with_radius.dart';
import 'package:amoresms/model/pesan_model.dart';
import 'package:amoresms/page/detailsmessage_screen/body.dart';
import 'package:amoresms/util/size_config.dart';
import 'package:amoresms/views/content_of_detailpesan.dart';
import 'package:flutter/material.dart';
import 'package:amoresms/util/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

String phoneNumber;

class Detail extends StatelessWidget {
  final List<Penerima> penerimaPesan;
  final String pesan;

 // Future checkUserLogged() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var obtainPhoneNumber = prefs.getString('userKey');
  //   setState(() {
  //     phoneNumber = obtainPhoneNumber;
  //   });
  //   print(phoneNumber);
  // }

  const Detail({Key key, this.penerimaPesan, this.pesan}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(penerimaPesan: penerimaPesan,
      pesan: pesan
      ),
      
    );
  }
}