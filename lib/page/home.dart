import 'package:amoresms/components/contacts_elements.dart';
import 'package:amoresms/model/contacts.dart';
import 'package:amoresms/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:amoresms/model/pesan.dart';

class Home extends StatefulWidget {
  Home(String phoneNumber, {Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          child: Icon(
            FlutterIcons.send_mco,
            size: 28,
          ),
          backgroundColor: bluePrimary.withOpacity(0.9),
          splashColor: Color(0xffD7E9FF),
        ),
        backgroundColor: bluePrimary,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              right: 0,
              child: Image.asset('assets/images/topbarhomeimages.png'),
            ),
            Positioned(
              top: size.height * 0.22,
              child: Material(
                color: Colors.transparent,
                elevation: 40,
                child: Container(
                  height: size.height * 0.75,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  child: ListView.builder(
                    itemCount: listPesan.length,
                    itemBuilder: (context, i) {
                      Pesan pesan = Pesan(
                        jam: listPesan[i]['jam'],
                        hari: listPesan[i]['hari'],
                        tanggal: listPesan[i]['tanggal'],
                        detailPesan: listPesan[i]['detailPesan']
                      );
                      print(pesan.hari);
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () => print("${pesan.hari}"),
                          child: ContactElement(
                            pesan: pesan,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
