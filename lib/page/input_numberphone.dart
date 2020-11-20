import 'package:amoresms/page/otp_verification.dart';
import 'package:amoresms/util/constants.dart';
import 'package:amoresms/util/otp_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class InputPhoneNumber extends StatefulWidget {
  const InputPhoneNumber({Key key}) : super(key: key);

  @override
  _InputPhoneNumberState createState() => _InputPhoneNumberState();
}

class _InputPhoneNumberState extends State<InputPhoneNumber> {

  @override
  void initState() { 
    super.initState();
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
      ],
    );  
  }

  final inputPhoneNumberController = TextEditingController();
  int minNumber = 10000;
  int maxNumber = 99999;
  String countryCode = "+62";
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: white,
      body: Column(
        children: <Widget>[
          Container(
            color: white,
            height: size.height * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Masukan Nomor\ntelepon untuk memulai",
                  style: TextStyle(
                    color: bluePrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 13,
                ),
                Text(
                  "Anda akan mendapatkan kode verifikasi\nTarif operator mungkin berlaku",
                  style: TextStyle(
                    color: bluePrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 56.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 46.0, right: 46.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 5,
                          color: bluePrimary.withOpacity(0.28),
                          blurRadius: 40,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: inputPhoneNumberController,
                      keyboardType: TextInputType.phone,
                      maxLength: 14,
                      decoration: InputDecoration(
                        hintMaxLines: 16,
                        prefixText: '+62',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(14.0),
                          ),
                          borderSide:
                              BorderSide(color: bluePrimary, width: 1.5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(14.0),
                          ),
                          borderSide:
                              BorderSide(color: bluePrimary, width: 1.5),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: size.height * 0.5,
            width: size.width,
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
                    onPressed: () async {
                      if (inputPhoneNumberController.text != "" ||
                          inputPhoneNumberController.text.length != 0) {
                        OtpServices otp = await checkpermission(
                            inputPhoneNumberController.text);
                        Get.to(OtpVerification(
                          otp,
                          inputPhoneNumberController.text,
                        ));
                      } else {
                        Fluttertoast.showToast(
                          msg: "Number Cannot be Empty !",
                          toastLength: Toast.LENGTH_LONG,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      }
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
