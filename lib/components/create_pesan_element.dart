import 'package:amoresms/model/pesan_model.dart';
import 'package:amoresms/util/constants.dart';
import 'package:amoresms/views/content_of_createpesan.dart';
import 'package:flutter/material.dart';

class CreatePesanElement extends StatefulWidget {
  final List<Penerima> listPenerima;
  final Penerima penerima;
  const CreatePesanElement({Key key, this.penerima, this.listPenerima})
      : super(key: key);

  @override
  _CreatePesanElementState createState() => _CreatePesanElementState();
}



class _CreatePesanElementState extends State<CreatePesanElement> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        top: 5.0,
      ),
      child: Container(
        height: size.height * 0.1,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Container(
                    height: 46,
                    width: 46,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage('assets/images/profilepicture.png'),
                          fit: BoxFit.fill,
                        )),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.040,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.penerima.namaPenerima}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        '${widget.penerima.noPenerima}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
