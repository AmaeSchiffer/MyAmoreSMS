import 'package:amoresms/components/detailpesan_elements.dart';
import 'package:amoresms/components/text_component.dart';
import 'package:amoresms/model/detail_pesan.dart';
import 'package:amoresms/model/pesan_model.dart';
import 'package:amoresms/util/constants.dart';
import 'package:flutter/material.dart';

class ContentOfDetailPesan extends StatefulWidget {
  final List<Penerima> detailPesan;
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
            Penerima penerima = Penerima(
              idPenerima: widget.detailPesan[i].idPenerima,
              namaPenerima: widget.detailPesan[i].namaPenerima,
              noPenerima: widget.detailPesan[i].noPenerima,
              status: widget.detailPesan[i].status,
            );
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () => print(penerima.namaPenerima),
                child: DetailPesanComponent(
                  penerima: penerima,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
