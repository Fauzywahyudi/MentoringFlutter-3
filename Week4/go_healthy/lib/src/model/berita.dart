import 'dart:convert';

List<Berita> beritaFromJson(String str) =>
    List<Berita>.from(json.decode(str).map((x) => Berita.fromJson(x)));

String beritaToJson(List<Berita> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Berita {
  Berita({
    this.idBerita,
    this.judul,
    this.isiBerita,
    this.penulis,
    this.sumber,
    this.image,
    this.postedAt,
  });

  String idBerita;
  String judul;
  String isiBerita;
  String penulis;
  String sumber;
  String image;
  DateTime postedAt;

  factory Berita.fromJson(Map<String, dynamic> json) => Berita(
        idBerita: json["id_berita"],
        judul: json["judul"],
        isiBerita: json["isi_berita"],
        penulis: json["penulis"],
        sumber: json["sumber"],
        image: json["image"],
        postedAt: DateTime.parse(json["posted_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id_berita": idBerita,
        "judul": judul,
        "isi_berita": isiBerita,
        "penulis": penulis,
        "sumber": sumber,
        "image": image,
        "posted_at": postedAt.toIso8601String(),
      };
}
