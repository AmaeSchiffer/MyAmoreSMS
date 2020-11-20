import 'package:amoresms/model/pesan_model.dart';
import 'package:amoresms/services/api_services.dart';
import 'package:amoresms/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amoresms/page/detail.dart';
import 'package:amoresms/components/pesan_elements.dart';

class ListViewPesan extends StatelessWidget {
  final List<Pesan> listPesan;
  const ListViewPesan({Key key, this.listPesan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: listPesan.length,
      itemBuilder: (context, i) {
        //Pesan data = listPesan[i];
        Pesan data = Pesan(
          jam: listPesan[i].jam,
          hari: listPesan[i].hari,
          tanggal: listPesan[i].tanggal,
          pesan: listPesan[i].pesan,
          penerima: listPesan[i].penerima,
        );
        //print("pesan : ${data.pesan}");
        //print("penerima home : ${data.penerima[i].namaPenerima}");
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () => Get.to(
              Detail(
                detailPesan: data.penerima,
                pesan: data.pesan,
              ),
            ),
            child: PesanElement(
              pesan: listPesan,
              index: i,
            ),
          ),
        );
      },
    );
  }
}
