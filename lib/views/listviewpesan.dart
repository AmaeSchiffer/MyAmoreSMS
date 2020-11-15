import 'package:flutter/material.dart';
import 'package:amoresms/model/pesan.dart';
import 'package:get/get.dart';
import 'package:amoresms/page/detail.dart';
import 'package:amoresms/components/pesan_elements.dart';
import 'package:amoresms/util/constants.dart';

class ListViewPesan extends StatelessWidget {
  const ListViewPesan({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      elevation: 40,
      child: Container(
        height: size.height * 0.75,
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: listPesan.length,
          itemBuilder: (context, i) {
            Pesan pesan = Pesan(
                jam: listPesan[i]['jam'],
                hari: listPesan[i]['hari'],
                tanggal: listPesan[i]['tanggal'],
                detailPesan: listPesan[i]['details']);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () => Get.to(
                  Detail(
                    detailPesan: pesan.detailPesan,
                  ),
                ),
                child: PesanElement(
                  pesan: pesan,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
