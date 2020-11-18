import 'package:amoresms/model/pesan_model.dart';
import 'package:amoresms/util/constants.dart';
import 'package:http/http.dart' as http;

final apiServices = ApiServices();


class ApiServices {
  Future getPesan() async {
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
}
