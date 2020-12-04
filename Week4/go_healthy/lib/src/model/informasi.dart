import 'dart:convert';

List<Informasi> informasiFromJson(String str) =>
    List<Informasi>.from(json.decode(str).map((x) => Informasi.fromJson(x)));

String informasiToJson(List<Informasi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Informasi {
  Informasi({
    this.idInformasi,
    this.judul,
    this.jenis,
    this.image,
    this.sumber,
    this.penjelasan,
    this.createAt,
  });

  int idInformasi;
  String judul;
  String jenis;
  String image;
  String sumber;
  String penjelasan;
  DateTime createAt;

  factory Informasi.fromJson(Map<String, dynamic> json) => Informasi(
        idInformasi: int.parse(json["id_informasi"]),
        judul: json["judul"],
        jenis: json["jenis"],
        image: json["image"],
        sumber: json["sumber"],
        penjelasan: json["penjelasan"],
        createAt: DateTime.parse(json["create_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id_informasi": idInformasi.toString(),
        "judul": judul,
        "jenis": jenis,
        "image": image,
        "sumber": sumber,
        "penjelasan": penjelasan,
        "create_at": createAt.toIso8601String(),
      };
}
