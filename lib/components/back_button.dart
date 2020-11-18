import 'package:amoresms/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackBtn extends StatelessWidget {
  const BackBtn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.navigate_before,
        color: Colors.blue,
        size: 40
      ),
      onPressed: () {
        Get.back();
      },
    );
  }
}
