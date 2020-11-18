import 'package:amoresms/model/pesan_model.dart';
import 'package:amoresms/services/api_services.dart';
import 'package:amoresms/util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:amoresms/model/pesan.dart';
import 'package:get/get.dart';
import 'package:amoresms/page/detailsmessage_screen/detail.dart';
import 'package:amoresms/components/pesan_elements.dart';
import 'package:amoresms/util/constants.dart';

class ListViewPesan extends StatelessWidget {
  const ListViewPesan({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: apiServices.getPesan(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("Data ${snapshot.error}"));
          } else {
            List<Pesan> listPesan = snapshot.data;
            return !snapshot.hasData
                ? Center(child: CircularProgressIndicator())
                : Container(
                    height: SizeConfig.screenHeight * 0.75,
                    width: SizeConfig.screenWidth,
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
                        //Pesan data = listPesan[i];
                        Pesan data = Pesan(
                          jam: listPesan[i].jam,
                          hari: listPesan[i].hari,
                          tanggal: listPesan[i].tanggal,
                          pesan: listPesan[i].pesan,
                          penerima: listPesan[i].penerima,
                        );
                        print("pesan : ${data.pesan}");
                        //print("penerima home : ${data.penerima[i].namaPenerima}");
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () => Get.to(
                              Detail(
                                penerimaPesan: data.penerima,
                                pesan: data.pesan,
                              ),
                            ),
                            child: PesanElement(
                              pesan: data,
                            ),
                          ),
                        );
                      },
                    ),
                  );
          }
        });
  }
}
