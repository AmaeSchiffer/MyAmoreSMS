
import 'package:flutter/material.dart';
import 'package:amoresms/model/detail_pesan.dart';
import 'package:amoresms/util/constants.dart';
class Detail extends StatefulWidget {
  final DetailPesan pesan;
  Detail(List<Map<String, dynamic>> detailPesan, {this.pesan,Key key}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bluePrimary,
    );
  }
}