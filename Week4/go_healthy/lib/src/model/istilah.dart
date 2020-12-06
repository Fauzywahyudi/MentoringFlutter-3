import 'dart:convert';

List<Istilah> istilahFromJson(String str) =>
    List<Istilah>.from(json.decode(str).map((x) => Istilah.fromJson(x)));

String istilahToJson(List<Istilah> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Istilah {
  Istilah({
    this.idIstilah,
    this.namaIstilah,
    this.penjelasan,
  });

  int idIstilah;
  String namaIstilah;
  String penjelasan;

  factory Istilah.fromJson(Map<String, dynamic> json) => Istilah(
        idIstilah: int.parse(json["id_istilah"]),
        namaIstilah: json["nama_istilah"],
        penjelasan: json["penjelasan"],
      );

  Map<String, dynamic> toJson() => {
        "id_istilah": idIstilah.toString(),
        "nama_istilah": namaIstilah,
        "penjelasan": penjelasan,
      };
}
