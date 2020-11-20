import 'dart:convert';

import 'package:amoresms/model/pesan_model.dart';
import 'package:amoresms/util/constants.dart';
import 'package:http/http.dart' as http;

final apiServices = ApiServices();

class ApiServices {
  Future<List<Pesan>> getPesan() async {
    try {
      final response = await http.get(baseUrl + "PesanDetails");
      if (response.statusCode == 200) {
        return smsModelFromJson(response.body).pesan;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future setPesan(Pesan pesan) async {
    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    var body = json.encode({
      "jamPesan": pesan.jam,
      "hariPesan": pesan.hari,
      "tanggalPesan": pesan.tanggal,
      "pesan": pesan.pesan,
      "penerima": List<dynamic>.from(pesan.penerima.map((x) => x.toJson())),
    });
    try {
      final response =
          await http.post(baseUrl + "Pesan", body: body, headers: header);
      //print("response: "+response.body.toString().split("\n")[58]);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print("Exception: " + e.toString());
      return null;
    }
  }

  Future setPenerima() async {
    try {
      final response = await http.post(baseUrl + "Penerima");
      if (response.statusCode == 200) {
        return smsModelFromJson(response.body).pesan;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
