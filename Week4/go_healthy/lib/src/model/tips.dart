import 'dart:convert';

List<Tips> tipsFromJson(String str) =>
    List<Tips>.from(json.decode(str).map((x) => Tips.fromJson(x)));

String tipsToJson(List<Tips> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tips {
  Tips({
    this.idTips,
    this.judulTips,
    this.sumber,
    this.image,
    this.createAt,
    this.updateAt,
  });

  String idTips;
  String judulTips;
  String sumber;
  String image;
  DateTime createAt;
  DateTime updateAt;

  factory Tips.fromJson(Map<String, dynamic> json) => Tips(
        idTips: json["id_tips"],
        judulTips: json["judul_tips"],
        sumber: json["sumber"],
        image: json["image"],
        createAt: DateTime.parse(json["create_at"]),
        updateAt: DateTime.parse(json["update_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id_tips": idTips,
        "judul_tips": judulTips,
        "sumber": sumber,
        "image": image,
        "create_at": createAt.toIso8601String(),
        "update_at": updateAt.toIso8601String(),
      };
}
