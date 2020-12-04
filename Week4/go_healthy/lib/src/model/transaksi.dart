import 'dart:convert';

List<Transaksi> transaksiFromJson(String str) =>
    List<Transaksi>.from(json.decode(str).map((x) => Transaksi.fromJson(x)));

String transaksiToJson(List<Transaksi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Transaksi {
  Transaksi({
    this.idTransaksi,
    this.idUser,
    this.jenisTransaksi,
    this.jumlahTransaksi,
    this.deskripsi,
    this.createAt,
  });

  int idTransaksi;
  int idUser;
  String jenisTransaksi;
  int jumlahTransaksi;
  String deskripsi;
  DateTime createAt;

  factory Transaksi.fromJson(Map<String, dynamic> json) => Transaksi(
        idTransaksi: int.parse(json["id_transaksi"]),
        idUser: int.parse(json["id_user"]),
        jenisTransaksi: json["jenis_transaksi"],
        jumlahTransaksi: int.parse(json["jumlah_transaksi"]),
        deskripsi: json["deskripsi"],
        createAt: DateTime.parse(json["create_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id_transaksi": idTransaksi.toString(),
        "id_user": idUser.toString(),
        "jenis_transaksi": jenisTransaksi,
        "jumlah_transaksi": jumlahTransaksi.toString(),
        "deskripsi": deskripsi,
        "create_at": createAt.toIso8601String(),
      };
}
