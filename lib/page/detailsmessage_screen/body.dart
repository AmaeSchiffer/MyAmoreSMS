import 'package:amoresms/components/back_button.dart';
import 'package:amoresms/components/detailpesan_elements.dart';
import 'package:amoresms/components/text_component.dart';
import 'package:amoresms/components/topimages.dart';
import 'package:amoresms/components/white_box_with_radius.dart';
import 'package:amoresms/model/pesan_model.dart';
import 'package:amoresms/util/constants.dart';
import 'package:amoresms/util/size_config.dart';
import 'package:amoresms/views/content_of_detailpesan.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final List<Penerima> penerimaPesan;
  final String pesan;

  const Body({Key key, this.penerimaPesan, this.pesan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          TopImages(
            images: 'assets/images/detailpesantopimages.png',
            right: 0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(24)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              BackBtn(),
              TextPesan(pesan: pesan),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(8)),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  child: ListView.builder(
                      itemCount: penerimaPesan.length,
                      itemBuilder: (context, i) {
                        //Penerima data = penerimaPesan[i];
                        Penerima penerima = Penerima(
                          idPenerima: penerimaPesan[i].idPenerima,
                          namaPenerima: penerimaPesan[i].namaPenerima,
                          noPenerima: penerimaPesan[i].noPenerima,
                          status: penerimaPesan[i].status,
                        );
                        print("${penerima}");
                        return Container(
                          padding:
                              EdgeInsets.all(getProportionateScreenWidth(10)),
                          margin:
                              EdgeInsets.all(getProportionateScreenWidth(10)),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Row(
                            //row buat semua isi konten
                            children: <Widget>[
                              Container(
                                height: getProportionateScreenWidth(50),
                                width: getProportionateScreenWidth(50),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  // image: DecorationImage(
                                  //   //image: NetworkImage('${detailPesan.photo}'),
                                  //   fit: BoxFit.fill,
                                  // )
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${penerima.namaPenerima}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            getProportionateScreenWidth(16)),
                                  ),
                                  SizedBox(
                                      height: getProportionateScreenWidth(10)),
                                  Text(
                                    '${penerima.noPenerima}',
                                    style: TextStyle(
                                      fontSize: getProportionateScreenWidth(14),
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              getDelivered(penerima.status),
                            ],
                          ),
                        );
                      }),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }

  Widget getDelivered(String berita) {
    Container container = new Container();
    if (equalIgnoreCase(berita, "Delivered")) {
      container = Container(
        height: 34,
        width: 34,
        child: Image.asset('assets/images/deliveredimages.png'),
      );
    } else if (equalIgnoreCase(berita, "Error")) {
      container = Container(
        height: 34,
        width: 34,
        child: Image.asset('assets/images/errorimages.png'),
      );
    }
    return container;
  }
}

class TextPesan extends StatelessWidget {
  const TextPesan({
    Key key,
    @required this.pesan,
  }) : super(key: key);

  final String pesan;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getProportionateScreenWidth(4)),
      height: SizeConfig.screenHeight * 0.3,
      width: double.infinity,
      decoration: BoxDecoration(
        color: white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: bluePrimary,
        ),
      ),
      child: Text(
        "${pesan}",
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
