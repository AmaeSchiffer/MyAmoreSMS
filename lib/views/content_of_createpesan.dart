import 'dart:io';

import 'package:amoresms/components/text_component.dart';
import 'package:amoresms/model/pesan_model.dart';
import 'package:amoresms/util/constants.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:amoresms/components/create_pesan_element.dart';

class ContentOfCreatePesan extends StatefulWidget {
  ContentOfCreatePesan({Key key}) : super(key: key);
  @override
  _ContentOfCreatePesanState createState() => _ContentOfCreatePesanState();
}

class _ContentOfCreatePesanState extends State<ContentOfCreatePesan> {
  List<Penerima> listPenerima = new List();
  CreatePesanElement createPesanElement;
  PhoneContact _phoneContact;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> openStorage() async {
    var storagesStatus = await Permission.storage.status;
    if (!storagesStatus.isGranted) await Permission.storage.request();
    if (await Permission.sms.isGranted) {
      FilePickerResult result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xls', 'xlsx'],
      );
      if (result != null) {
        PlatformFile file = result.files.first;
        print(file.path);
        var bytes = File(file.path).readAsBytesSync();
        var excel = Excel.decodeBytes(bytes);
        for (var table in excel.tables.keys) {
          print(table); //sheet Name
          print(excel.tables[table].maxCols);
          print(excel.tables[table].maxRows);
          for (var row in excel.tables[table].rows) {
            print("$row");
          }
        }
      } else {}
    }
  }

  Future<void> openPhoneContact() async {
    var contactStatus = await Permission.contacts.status;
    if (!contactStatus.isGranted) await Permission.contacts.request();
    if (await Permission.sms.isGranted) {
      final PhoneContact contact =
          await FlutterContactPicker.pickPhoneContact();
      setState(
        () {
          listPenerima.add(
            Penerima(
              noPenerima: contact.phoneNumber.number,
              namaPenerima: contact.fullName,
            ),
          );
        },
      );
    } else {
      Fluttertoast.showToast(
        msg: "SMS Permission not Granted !",
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  final inputPhoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            top: 12.0,
            left: 20.0,
          ),
          child: TextComponent(
            text: "Send Messages",
            fontSize: 18,
            color: bluePrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            left: 20.0,
            right: 20.0,
          ),
          child: Container(
            height: size.height * 0.1,
            width: size.width,
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 0,
                  child: GestureDetector(
                    onTap: () {
                      print("Pilih Berkas clicked !");
                      openStorage();
                    },
                    child: Container(
                      width: size.width * 0.4,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: bluePrimary,
                          borderRadius: BorderRadius.all(
                            Radius.circular(18),
                          ),
                          border: Border.all(color: bluePrimary)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextComponent(
                          text: "Pilih Berkas",
                          fontSize: 14,
                          color: white,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: size.width * 0.3,
                  child: GestureDetector(
                    onTap: () {
                      print("Tambah Kontak clicked !");
                      openPhoneContact();
                    },
                    child: Container(
                      width: size.width * 0.4,
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(18),
                          ),
                          border: Border.all(color: bluePrimary)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextComponent(
                          text: "Tambah Kontak",
                          fontSize: 14,
                          color: bluePrimary,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: listPenerima.length,
            itemBuilder: (context, i) {
              Penerima penerima = Penerima(
                namaPenerima: listPenerima[i].namaPenerima,
                noPenerima: listPenerima[i].noPenerima,
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
                      listPenerima: listPenerima,
                    ),
                  ),
                ),
                onDismissed: (direction) {
                  setState(
                    () {
                      listPenerima.removeAt(i);
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
