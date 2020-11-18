import 'package:amoresms/components/detailpesan_elements.dart';
import 'package:amoresms/components/text_component.dart';
import 'package:amoresms/model/detail_pesan.dart';
import 'package:amoresms/model/pesan_model.dart';
import 'package:amoresms/util/constants.dart';
import 'package:amoresms/util/size_config.dart';
import 'package:flutter/material.dart';

class ContentOfDetailPesan extends StatelessWidget {
  final List<Penerima> penerimaPesan;
  final String pesan;

  const ContentOfDetailPesan({Key key, this.penerimaPesan, this.pesan})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            top: getProportionateScreenWidth(10),
            left: getProportionateScreenWidth(24),
          ),
          child: TextComponent(
            text: "Receiver Messages ${penerimaPesan[0].namaPenerima}",
            fontSize: getProportionateScreenWidth(20),
            color: bluePrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        ListView.builder(
          //shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: penerimaPesan.length,
          itemBuilder: (context, i) {
            //Penerima data = penerimaPesan[i];
            Penerima penerima = Penerima(
              idPenerima: penerimaPesan[i].idPenerima,
              namaPenerima: penerimaPesan[i].namaPenerima,
              noPenerima: penerimaPesan[i].noPenerima,
              status: penerimaPesan[i].status,
            );
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(8)),
              child: InkWell(
                onTap: () => print(penerima.namaPenerima),
                child:
                DetailPesanComponent(
                  detailPesan: penerima,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
