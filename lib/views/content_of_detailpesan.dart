import 'package:amoresms/components/detailpesan_elements.dart';
import 'package:amoresms/components/text_component.dart';
import 'package:amoresms/model/detail_pesan.dart';
import 'package:amoresms/model/pesan_model.dart';
import 'package:amoresms/util/constants.dart';
import 'package:flutter/material.dart';

class ContentOfDetailPesan extends StatefulWidget {
  final List<Penerima> detailPesan;
  ContentOfDetailPesan({Key key, @required this.detailPesan}) : super(key: key);

  @override
  _ContentOfDetailPesanState createState() => _ContentOfDetailPesanState();
}

class _ContentOfDetailPesanState extends State<ContentOfDetailPesan> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 28.0, top: 12),
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
    );
  }
}
