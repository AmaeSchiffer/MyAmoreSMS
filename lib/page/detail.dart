import 'package:amoresms/components/detailpesan_elements.dart';
import 'package:flutter/material.dart';
import 'package:amoresms/model/detail_pesan.dart';
import 'package:amoresms/util/constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

String phoneNumber;
class Detail extends StatefulWidget {
  final List<Map<String, dynamic>> detailPesan;
  final String pesan;
  Detail({@required this.detailPesan, @required this.pesan, Key key})
      : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  Future checkUserLogged() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var obtainPhoneNumber = prefs.getString('userKey');
    setState(() {
      phoneNumber = obtainPhoneNumber;
    });
    print(phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: bluePrimary,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              right: 0,
              child: Image.asset('assets/images/detailpesantopimages.png'),
            ),
            Positioned(
              left: 5,
              child: IconButton(
                icon: Icon(
                  Icons.navigate_before,
                  color: white,
                  size: 40,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            Positioned(
              left: 17,
              top: 48,
              child: Container(
                height: size.height * 0.175,
                width: size.width * 0.81,
                decoration: BoxDecoration(
                  color: white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: bluePrimary,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 12.0),
                  child: Text(
                    "${widget.pesan}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.25,
              child: Material(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 12.0,
                          left: 20.0,
                        ),
                        child: Text(
                          "Receiver Messages",
                          style: TextStyle(
                              fontSize: 18,
                              color: bluePrimary,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: widget.detailPesan.length,
                        itemBuilder: (context, i) {
                          DetailPesan pesan = DetailPesan(
                            photo: widget.detailPesan[i]['photo'],
                            nama: widget.detailPesan[i]['nama'],
                            nomertelpon: widget.detailPesan[i]['nomertelpon'],
                            berita: widget.detailPesan[i]['berita'],
                          );
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () => print(pesan.nama),
                              child: DetailPesanComponent(
                                detailPesan: pesan,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
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
