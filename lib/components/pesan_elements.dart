import 'dart:io';

import 'package:amoresms/model/pesan_model.dart';
import 'package:amoresms/util/constants.dart';
import 'package:filesystem_picker/filesystem_picker.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xls;

class PesanElement extends StatefulWidget {
  final List<Pesan> pesan;
  final int index;
  const PesanElement({Key key, this.pesan, this.index}) : super(key: key);

  @override
  _PesanElementState createState() => _PesanElementState();
}

class _PesanElementState extends State<PesanElement> {
  Directory rootPath;
  String filePath;
  String dirPath;
  bool createPesan = false;
  @override
  void initState() {
    super.initState();
    _prepareStorage();
  }

  Future<void> _prepareStorage() async {
    rootPath = Directory('/storage/emulated/0/');
    Directory sampleFolder = Directory('${rootPath.path}/AmoreExport');
    if (!sampleFolder.existsSync()) {
      sampleFolder.createSync();
    }
  }

  Future<void> _pickDir() async {
    var storagesStatus = await Permission.storage.status;
    if (!storagesStatus.isGranted) await Permission.storage.request();
    String path = await FilesystemPicker.open(
      title: 'Save to folder',
      context: context,
      rootDirectory: rootPath,
      fsType: FilesystemType.folder,
      pickText: 'Save file to this folder',
      folderIconColor: Colors.teal,
      requestPermission: () async =>
          await Permission.storage.request().isGranted,
    );

    setState(() {
      dirPath = path;
      createPesan = true;
    });
    _createExcelFile();
    Navigator.of(context).pop();
  }

  Future<void> _createExcelFile() async {
    if (createPesan) {
      var j = 2;
      xls.Workbook workbook = new xls.Workbook();
      //Accessing via index
      xls.Worksheet sheet = workbook.worksheets[0];
      sheet.name = "Pesan";
      sheet.showGridlines = true;

      sheet.getRangeByName('A1').setText('jam');
      sheet.getRangeByName('B1').setText('hari');
      sheet.getRangeByName('C1').setText('tanggal');
      sheet.getRangeByName('D1').setText('pesan');

      for (var i = 2; i < 3; i++) {
        sheet
            .getRangeByName('A' + i.toString())
            .setText(widget.pesan[widget.index].jam);
        sheet
            .getRangeByName('B' + i.toString())
            .setText(widget.pesan[widget.index].hari);
        sheet
            .getRangeByName('C' + i.toString())
            .setText(widget.pesan[widget.index].tanggal);
        sheet
            .getRangeByName('D' + i.toString())
            .setText(widget.pesan[widget.index].pesan);
      }
      
      sheet = workbook.worksheets.addWithName('Penerima');
      sheet.getRangeByName('A1').setText('namaPenerima');
      sheet.getRangeByName('B1').setText('nomerPenerima');
      sheet.getRangeByName('C1').setText('status');

      widget.pesan[widget.index].penerima.forEach((element) {
        sheet.getRangeByName('A' + j.toString()).setText(element.namaPenerima);
        sheet.getRangeByName('B' + j.toString()).setText(element.noPenerima);
        sheet.getRangeByName('C' + j.toString()).setText(element.status);
        j++;
      });
      String namafile = "Export_File_" + widget.pesan[widget.index].tanggal;
      final List<int> bytes = workbook.saveAsStream();
      workbook.dispose();
      String pathToString = dirPath.toString();
      final File file = File('$pathToString/$namafile.xlsx');
      await file.writeAsBytes(bytes);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        top: 5.0,
      ),
      child: Container(
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
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    child: Image.asset(
                        getImageAsset(widget.pesan[widget.index].hari)),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.pesan[widget.index].jam}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${widget.pesan[widget.index].hari}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${widget.pesan[widget.index].tanggal}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(
                icon: Icon(
                  Icons.more_vert,
                  size: 28,
                ),
                onPressed: () {
                  //print(widget.pesan[widget.index].jam);
                  showDialog(
                    useSafeArea: true,
                    context: context,
                    builder: (_) => new AlertDialog(
                      title: new Text("Export"),
                      content: new Text("Do You want export to File?"),
                      actions: <Widget>[
                        FlatButton(
                            child: Text('Yes'),
                            onPressed: () {
                              _pickDir();
                            }),
                        FlatButton(
                          child: Text('No'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
