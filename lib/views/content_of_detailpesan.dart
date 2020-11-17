import 'package:amoresms/components/detailpesan_elements.dart';
import 'package:amoresms/components/text_component.dart';
import 'package:amoresms/model/detail_pesan.dart';
import 'package:amoresms/util/constants.dart';
import 'package:flutter/material.dart';

class ContentOfDetailPesan extends StatefulWidget {
  final List<Map<String, dynamic>> detailPesan;
  final String pesan;
  ContentOfDetailPesan(
      {Key key, @required this.detailPesan, @required this.pesan})
      : super(key: key);

  @override
  _ContentOfDetailPesanState createState() => _ContentOfDetailPesanState();
}

class _ContentOfDetailPesanState extends State<ContentOfDetailPesan> {
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
            text: "Receiver Messages",
            fontSize: 18,
            color: bluePrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: widget.detailPesan.length,
          itemBuilder: (context, i) {
            DetailPesan pesan = DetailPesan(
              photo: widget.detailPesan[i]['photo'],
              nama: widget.detailPesan[i]['nama'],
              nomertelpon: widget.detailPesan[i]['nomertelpon'],
              berita: widget.detailPesan[i]['berita'],
            );
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () => print(pesan.nama),
                child: DetailPesanComponent(
                  detailPesan: pesan,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
