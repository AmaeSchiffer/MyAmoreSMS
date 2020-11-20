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
    try {
      final response = await http.post(baseUrl + "Pesan", body: pesanModelToJson(pesan), headers: {'Content-type':'application/json'});
      print(response.body.toString());
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print("Exception: "+e.toString());
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
