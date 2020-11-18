import 'dart:convert';

SmsModel smsModelFromJson(String str) => SmsModel.fromJson(json.decode(str));
Pesan pesanFromJson(String str) => Pesan.fromJson(json.decode(str));

String smsModelToJson(SmsModel data) => json.encode(data.toJson());

class SmsModel {
  SmsModel({
    this.status,
    this.pesan,
  });

  bool status;
  List<Pesan> pesan;

  factory SmsModel.fromJson(Map<String, dynamic> json) => SmsModel(
        status: json["status"] == null ? null : json["status"],
        pesan: json["pesan"] == null
            ? null
            : List<Pesan>.from(json["pesan"].map((x) => Pesan.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "pesan": pesan == null
            ? null
            : List<dynamic>.from(pesan.map((x) => x.toJson())),
      };
}

class Pesan {
  Pesan({
    this.idPesan,
    this.jam,
    this.hari,
    this.tanggal,
    this.pesan,
    this.penerima,
  });

  String idPesan;
  String jam;
  String hari;
  String tanggal;
  String pesan;
  List<Penerima> penerima;

  factory Pesan.fromJson(Map<String, dynamic> json) => Pesan(
        idPesan: json["idPesan"] == null ? null : json["idPesan"],
        jam: json["jamPesan"] == null ? null : json["jamPesan"],
        hari: json["hariPesan"] == null ? null : json["hariPesan"],
        tanggal: json["tanggalPesan"] == null ? null : json["tanggalPesan"],
        pesan: json["pesan"] == null ? null : json["pesan"],
        penerima: json["penerima"] == null
            ? null
            : List<Penerima>.from(
                json["penerima"].map((x) => Penerima.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "idPesan": idPesan == null ? null : idPesan,
        "jamPesan": jam == null ? null : jam,
        "hariPesan": hari == null ? null : hari,
        "tanggalPesan": tanggal == null ? null : tanggal,
        "pesan": pesan == null ? null : pesan,
        "penerima": penerima == null
            ? null
            : List<dynamic>.from(penerima.map((x) => x.toJson())),
      };
}

class Penerima {
  Penerima({
    this.idPenerima,
    this.namaPenerima,
    this.noPenerima,
    this.status,
    this.idPesan,
  });

  String idPenerima;
  String namaPenerima;
  String noPenerima;
  String status;
  String idPesan;

  factory Penerima.fromJson(Map<String, dynamic> json) => Penerima(
        idPenerima: json["idPenerima"] == null ? null : json["idPenerima"],
        namaPenerima:
            json["namaPenerima"] == null ? null : json["namaPenerima"],
        noPenerima: json["noPenerima"] == null ? null : json["noPenerima"],
        status: json["status"] == null ? null : json["status"],
        idPesan: json["idPesan"] == null ? null : json["idPesan"],
      );

  Map<String, dynamic> toJson() => {
        "idPenerima": idPenerima == null ? null : idPenerima,
        "namaPenerima": namaPenerima == null ? null : namaPenerima,
        "noPenerima": noPenerima == null ? null : noPenerima,
        "status": status == null ? null : status,
        "idPesan": idPesan == null ? null : idPesan,
      };
}
