import 'package:amoresms/components/back_button.dart';
import 'package:amoresms/components/topimages.dart';
import 'package:amoresms/components/white_box_with_radius.dart';
import 'package:amoresms/util/constants.dart';
import 'package:amoresms/views/content_of_createpesan.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreatePesan extends StatefulWidget {
  CreatePesan({Key key}) : super(key: key);

  @override
  _CreatePesanState createState() => _CreatePesanState();
}

class _CreatePesanState extends State<CreatePesan> {
  final inputPhoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: bluePrimary,
        body: Stack(
          children: <Widget>[
            TopImages(
              right: 0,
              images: 'assets/images/createpesantopimages.png',
            ),
            Positioned(
              left: 5,
              child: BackBtn(),
            ),
            Positioned(
              top: size.height * 0.224,
              child: WhiteBoxRadius(
                size: size,
                height: 0.75,
                content: ContentOfCreatePesan(),
              ),
            ),
            Positioned(
              bottom: 10,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: size.width * 0.74,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: AutoSizeTextField(
                        cursorColor: black,
                        maxLines: null,
                        controller: inputPhoneNumberController,
                        minFontSize: 14,
                        decoration: InputDecoration(
                          hintText: "Input messages here",
                          fillColor: Colors.white,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                            borderSide:
                                BorderSide(color: bluePrimary, width: 1.5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                            borderSide:
                                BorderSide(color: bluePrimary, width: 1.5),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      color: bluePrimary,
                      iconSize: 50,
                      icon: Image.asset('assets/images/imagesbtnsend.png'),
                      onPressed: (){},
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
