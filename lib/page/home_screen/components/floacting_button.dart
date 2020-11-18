import 'package:amoresms/page/message_screen/create_pesan.dart';
import 'package:amoresms/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';


class FloactingActionButtonHome extends StatelessWidget {
  const FloactingActionButtonHome({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Get.to(CreatePesan());
      },
      child: Icon(
        FlutterIcons.message_mco,
        size: 28,
      ),
      backgroundColor: bluePrimary.withOpacity(0.9),
      splashColor: Color(0xffD7E9FF),
    );
  }
}
