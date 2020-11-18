import 'package:amoresms/util/constants.dart';
import 'package:amoresms/util/size_config.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';

class AutoSizeTextFieldCustom extends StatelessWidget {
  const AutoSizeTextFieldCustom({
    Key key,
    @required this.inputPhoneNumberController,
  }) : super(key: key);

  final TextEditingController inputPhoneNumberController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: SizeConfig.screenWidth * 0.74,
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
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
