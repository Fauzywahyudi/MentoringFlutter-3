import 'dart:convert';

List<Informasi> informasiFromJson(String str) =>
    List<Informasi>.from(json.decode(str).map((x) => Informasi.fromJson(x)));

String informasiToJson(List<Informasi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Informasi {
  Informasi({
    this.idInformasi,
    this.idTips,
    this.judulInformasi,
    this.isi,
    this.image,
    this.createAt,
    this.updateAt,
  });

  String idInformasi;
  String idTips;
  String judulInformasi;
  String isi;
  String image;
  DateTime createAt;
  DateTime updateAt;

  factory Informasi.fromJson(Map<String, dynamic> json) => Informasi(
        idInformasi: json["id_informasi"],
        idTips: json["id_tips"],
        judulInformasi: json["judul_informasi"],
        isi: json["isi"],
        image: json["image"],
        createAt: DateTime.parse(json["create_at"]),
        updateAt: DateTime.parse(json["update_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id_informasi": idInformasi,
        "id_tips": idTips,
        "judul_informasi": judulInformasi,
        "isi": isi,
        "image": image,
        "create_at": createAt.toIso8601String(),
        "update_at": updateAt.toIso8601String(),
      };
}
