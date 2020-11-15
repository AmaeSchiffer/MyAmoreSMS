import 'package:amoresms/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:amoresms/model/pesan.dart';

class PesanElement extends StatelessWidget {
  final Pesan pesan;
  const PesanElement({Key key, this.pesan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 5.0,),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          border: Border.all(
            color:bluePrimary,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    child: Image.asset(getImageAsset(pesan.hari)),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${pesan.jam}',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${pesan.hari}',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${pesan.tanggal}',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                height: 15,
                width: 15,
                child: Icon(
                  Icons.more_vert,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
