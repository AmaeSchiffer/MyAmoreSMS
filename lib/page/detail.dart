import 'package:amoresms/components/detailpesan_elements.dart';
import 'package:flutter/material.dart';
import 'package:amoresms/model/detail_pesan.dart';
import 'package:amoresms/util/constants.dart';

class Detail extends StatefulWidget {
  final List<Map<String, dynamic>> detailPesan;
  Detail({@required this.detailPesan, Key key}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
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
                onPressed: () {},
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
