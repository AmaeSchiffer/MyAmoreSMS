import 'package:amoresms/components/topimages.dart';
import 'package:amoresms/model/pesan_model.dart';
import 'package:amoresms/page/create_pesan.dart';
import 'package:amoresms/services/api_services.dart';
import 'package:amoresms/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:amoresms/views/listviewpesan.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  Home(String phoneNumber, {Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Pesan> pesan = [];


  Future getPesan() async {
    pesan = await apiServices.getPesan(); 
  }

  @override
  void initState() { 
    super.initState();
    getPesan();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Get.to(
              CreatePesan(
                lastIndexPesan: int.parse(pesan[pesan.length - 1].idPesan) ,
              ),
            );
          },
          child: Icon(
            FlutterIcons.message_mco,
            size: 28,
          ),
          backgroundColor: bluePrimary.withOpacity(0.9),
          splashColor: Color(0xffD7E9FF),
        ),
        backgroundColor: bluePrimary,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            TopImages(
              right: 0,
              images: 'assets/images/topbarhomeimages.png',
            ),
            Positioned(
              top: size.height * 0.22,
              child: FutureBuilder(
                future: apiServices.getPesan(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text("Data ${snapshot.error}"));
                  } else {
                    List<Pesan> listPesan = snapshot.data;
                    return !snapshot.hasData
                        ? Container(
                            height: size.height / 2,
                            width: size.width,
                            child: Center(
                              child: CircularProgressIndicator(
                                backgroundColor: white,
                              ),
                            ),
                          )
                        : Container(
                            height: size.height * 0.75,
                            width: size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                              ),
                            ),
                            child: ListViewPesan(
                              listPesan: listPesan,
                            ),
                          );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
