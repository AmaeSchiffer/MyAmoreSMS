import 'package:amoresms/model/detail_pesan.dart';
import 'package:amoresms/model/pesan_model.dart';
import 'package:amoresms/util/constants.dart';
import 'package:amoresms/util/size_config.dart';
import 'package:flutter/material.dart';

class DetailPesanComponent extends StatelessWidget {
  final Penerima detailPesan;
  const DetailPesanComponent({Key key, this.detailPesan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(4),
          vertical: getProportionateScreenWidth(8)),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          border: Border.all(
            color: bluePrimary,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenWidth(10),
              horizontal: getProportionateScreenWidth(10)),
          child: Row(
            //row buat semua isi konten
            children: <Widget>[
              Container(
                height: getProportionateScreenWidth(50),
                width: getProportionateScreenWidth(50),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      //image: NetworkImage('${detailPesan.photo}'),
                      fit: BoxFit.fill,
                    )),
              ),
              SizedBox(width: getProportionateScreenWidth(10)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${detailPesan.namaPenerima}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenWidth(16)),
                  ),
                  Text(
                    '${detailPesan.noPenerima}',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(14),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              Spacer(),
              getDelivered(detailPesan.status),
            ],
          ),
        ),
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
