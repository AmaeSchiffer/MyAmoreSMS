import 'dart:io';

import 'package:amoresms/components/back_button.dart';
import 'package:amoresms/components/create_pesan_element.dart';
import 'package:amoresms/components/text_component.dart';
import 'package:amoresms/components/topimages.dart';
import 'package:amoresms/model/pesan_model.dart';
import 'package:amoresms/services/api_services.dart';
import 'package:amoresms/util/constants.dart';
import 'package:amoresms/views/content_of_createpesan.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sms/sms.dart';

class CreatePesan extends StatefulWidget {
  final int lastIndexPesan;
  CreatePesan({Key key, this.lastIndexPesan}) : super(key: key);

  @override
  _CreatePesanState createState() => _CreatePesanState();
}

class _CreatePesanState extends State<CreatePesan> {
  @override
  void initState() {
    super.initState();
    print("index: " + widget.lastIndexPesan.toString());
  }

  final inputPhoneNumberController = TextEditingController();
  List<Penerima> listPenerima = [];
  List<Penerima> listPostPenerima = [];
  Pesan postPesan;
  List<String> listPhoneNumber = new List();
  CreatePesanElement createPesanElement;
  PhoneContact _phoneContact;
  String _messages;
  bool _progressBarActive = false;
  bool _cansendmessages = false;
  String dropdownValue = '5 s';
  int timeinterval = 0;

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
          excel.tables[table].rows
              .getRange(1, excel.tables[table].maxRows)
              .forEach((element) {
            setState(() {
              listPenerima.add(
                  Penerima(namaPenerima: element[0], noPenerima: element[1]));
            });
          });
        }
      }
    } else {
      Fluttertoast.showToast(
        msg: "Storage Permission not Granted !",
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
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
        msg: "Contact Permission not Granted !",
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  Future<void> _sendSMS(int index, int ricipentsLength) async {
    String status;
    if (ricipentsLength == 0) {
      setState(() {
        _progressBarActive = false;
        _cansendmessages = false;
      });
      postPesan = Pesan(
        hari: getHari(),
        tanggal: getTanggal(),
        jam: getJam(),
        pesan: inputPhoneNumberController.text,
        penerima: listPostPenerima,
      );
      apiServices.setPesan(postPesan);
    } else {
      setState(() {
        _progressBarActive = true;
        _cansendmessages = true;
      });
      int duration = timeinterval == 0 ? 5 : timeinterval;
      Future.delayed(Duration(seconds: duration), () async {
        SmsSender sender = new SmsSender();
        SmsMessage message = new SmsMessage(
            listPenerima[index].noPenerima, inputPhoneNumberController.text);
        message.onStateChanged.listen((state) {
          if (state == SmsMessageState.Sent) {
            status = "Error";
            // Fluttertoast.showToast(
            //   msg: "Messages has sent to " + listPenerima[index].noPenerima,
            //   toastLength: Toast.LENGTH_LONG,
            //   backgroundColor: Colors.yellow,
            //   textColor: Colors.white,
            //   fontSize: 16.0,
            // );
          } else if (state == SmsMessageState.Delivered) {
            status = "Delivered";
            // Fluttertoast.showToast(
            //   msg:
            //       "Messages has delivered to " + listPenerima[index].noPenerima,
            //   toastLength: Toast.LENGTH_LONG,
            //   backgroundColor: Colors.green,
            //   textColor: Colors.white,
            //   fontSize: 16.0,
            // );
          }
        });
        sender.sendSms(message);
        int lastIndex = widget.lastIndexPesan + 1;
        listPostPenerima.add(
          Penerima(
              idPesan: lastIndex.toString(),
              namaPenerima: listPenerima[index].namaPenerima,
              noPenerima: listPenerima[index].noPenerima,
              status: status),
        );
        // print(getHari());
        // print(getJam());
        // print(getTanggal());
        return _sendSMS(index + 1, ricipentsLength - 1);
      });
    }
  }

  void cansendSMS() async {
    var smsStatus = await Permission.sms.status;
    if (!smsStatus.isGranted) await Permission.sms.request();
    if (await Permission.sms.isGranted) {
      if (!_cansendmessages) {
        _sendSMS(0, listPenerima.length);
      } else {
        Fluttertoast.showToast(
          msg: "You are sending a message please wait ..",
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
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

  List<String> getListPhoneNumber(List<Penerima> listpenerima) {
    List<String> listPhoneNumber = List();
    listpenerima.forEach((element) {
      listPhoneNumber.add(element.noPenerima);
    });
    return listPhoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: true,
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
                  child: _progressBarActive
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(bluePrimary),
                            ),
                            SizedBox(
                              height: 12.0,
                            ),
                            Text(
                              "Sending Messages...",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: bluePrimary,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        )
                      : Column(
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
                                left: 14.0,
                                right: 20.0,
                              ),
                              child: Container(
                                height: size.height * 0.06,
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
                                          width: size.width * 0.35,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: bluePrimary,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(18),
                                              ),
                                              border: Border.all(
                                                  color: bluePrimary)),
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
                                      left: size.width * 0.29,
                                      child: GestureDetector(
                                        onTap: () {
                                          print("Tambah Kontak clicked !");
                                          openPhoneContact();
                                        },
                                        child: Container(
                                          width: size.width * 0.35,
                                          alignment: Alignment.centerRight,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(18),
                                            ),
                                            border:
                                                Border.all(color: bluePrimary),
                                          ),
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
                                    Positioned(
                                      right: 0,
                                      child: Container(
                                        height: size.height * 0.05,
                                        width: size.width * 0.26,
                                        alignment: Alignment.center,
                                        child: DropdownButton(
                                          value: dropdownValue,
                                          items: <String>[
                                            '5 s',
                                            '10 s',
                                            '15 s',
                                            '30 s',
                                            '60 s'
                                          ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          onChanged: (String newValue) {
                                            setState(() {
                                              dropdownValue = newValue;
                                              timeinterval = int.parse(
                                                  newValue.split(' ')[0]);
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ContentOfCreatePesan(list: listPenerima),
                          ],
                        ),
                ),
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
                      onPressed: () {
                        if (inputPhoneNumberController.text.length == 0 ||
                            listPenerima.isEmpty) {
                          Fluttertoast.showToast(
                            msg: "Message or Recipients can\'t be empty !",
                            toastLength: Toast.LENGTH_LONG,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        } else {
                          cansendSMS();
                        }
                      },
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
