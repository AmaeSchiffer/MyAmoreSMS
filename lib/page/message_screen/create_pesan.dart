import 'package:amoresms/components/back_button.dart';
import 'package:amoresms/components/topimages.dart';
import 'package:amoresms/components/white_box_with_radius.dart';
import 'package:amoresms/page/message_screen/components/body.dart';
import 'package:amoresms/util/constants.dart';
import 'package:amoresms/util/size_config.dart';
import 'package:amoresms/views/content_of_createpesan.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreatePesan extends StatefulWidget {
  CreatePesan({Key key}) : super(key: key);

  @override
  _CreatePesanState createState() => _CreatePesanState();
}

class _CreatePesanState extends State<CreatePesan> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bluePrimary,
        body: Body(),
      ),
    );
  }
}
