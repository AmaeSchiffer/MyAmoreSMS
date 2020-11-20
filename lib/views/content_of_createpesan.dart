import 'package:amoresms/model/pesan_model.dart';
import 'package:amoresms/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:amoresms/components/create_pesan_element.dart';
class ContentOfCreatePesan extends StatefulWidget {
  final List<Penerima> list;
  ContentOfCreatePesan({Key key, this.list}) : super(key: key);
  @override
  _ContentOfCreatePesanState createState() => _ContentOfCreatePesanState();
}

class _ContentOfCreatePesanState extends State<ContentOfCreatePesan> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: widget.list.length,
        itemBuilder: (context, i) {
          Penerima penerima = Penerima(
            namaPenerima: widget.list[i].namaPenerima,
            noPenerima: widget.list[i].noPenerima,
          );
          return Dismissible(
            background: Container(
              alignment: Alignment.centerLeft,
              color: white,
              child: Padding(
                padding: EdgeInsets.only(
                  left: size.width / 7,
                ),
                child: Image.asset('assets/images/trashimages.png'),
              ),
            ),
            key: UniqueKey(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () => print(penerima.namaPenerima),
                child: CreatePesanElement(
                  penerima: penerima,
                  listPenerima: widget.list,
                ),
              ),
            ),
            onDismissed: (direction) {
              setState(
                () {
                  widget.list.removeAt(i);
                },
              );
            },
          );
        },
      ),
    );
  }
}
