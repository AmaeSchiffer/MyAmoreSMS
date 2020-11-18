import 'package:amoresms/components/pesan_elements.dart';
import 'package:amoresms/components/text_component.dart';
import 'package:amoresms/model/pesan.dart';
import 'package:amoresms/util/constants.dart';
import 'package:flutter/material.dart';

class ContentOfCreatePesan extends StatefulWidget {
  ContentOfCreatePesan({Key key}) : super(key: key);

  @override
  _ContentOfCreatePesanState createState() => _ContentOfCreatePesanState();
}

class _ContentOfCreatePesanState extends State<ContentOfCreatePesan> {
  final inputPhoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            top: 12.0,
            left: 20.0,
          ),
          child: TextComponent(
            text: "Send Messages",
            fontSize: 18,
            color: bluePrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: listPesan.length,
            itemBuilder: (context, i) {
              // Pesan pesan = Pesan(
              //   jam: listPesan[i]['jam'],
              //   hari: listPesan[i]['hari'],
              //   tanggal: listPesan[i]['tanggal'],
              //   pesan: listPesan[i]['pesan'],
              //   detailPesan: listPesan[i]['details'],
              // );
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  // onTap: () => print(pesan.pesan),
                  // child: PesanElement(
                  //   pesan: pesan,
                  // ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
