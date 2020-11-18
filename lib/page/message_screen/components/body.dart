import 'package:amoresms/components/back_button.dart';
import 'package:amoresms/components/topimages.dart';
import 'package:amoresms/components/white_box_with_radius.dart';
import 'package:amoresms/page/message_screen/components/autosizetextfieldcustom.dart';
import 'package:amoresms/util/size_config.dart';
import 'package:amoresms/views/content_of_createpesan.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {

final inputPhoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Stack(
        children: <Widget>[
          TopImages(
            right: 0,
            images: 'assets/images/createpesantopimages.png',
          ),
          Positioned(
            left: 5,
            child: BackBtn(),
          ),
          Positioned(
            top: SizeConfig.screenHeight * 0.224,
            child: WhiteBoxRadius(
              height: SizeConfig.screenHeight * 0.7,
              content: ContentOfCreatePesan(),
            ),
          ),
          Positioned(
            bottom: 10,
            child: AutoSizeTextFieldCustom(inputPhoneNumberController: inputPhoneNumberController),
          ),
        ],
      ),
    );
  }
}

