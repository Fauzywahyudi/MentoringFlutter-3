import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    this.idUser,
    this.email,
    this.namaLengkap,
    this.uang,
    this.password,
    this.jenisKelamin,
    this.alamat,
    this.createAt,
    this.updateAt,
  });

  int idUser;
  String email;
  String namaLengkap;
  int uang;
  String password;
  String jenisKelamin;
  String alamat;
  DateTime createAt;
  DateTime updateAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        idUser: int.parse(json["id_user"]),
        email: json["email"],
        namaLengkap: json["nama_lengkap"],
        uang: int.parse(json["uang"]),
        password: json["password"],
        jenisKelamin: json["jenis_kelamin"],
        alamat: json["alamat"],
        createAt: DateTime.parse(json["create_at"]),
        updateAt: DateTime.parse(json["update_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id_user": idUser.toString(),
        "email": email,
        "nama_lengkap": namaLengkap,
        "uang": uang.toString(),
        "password": password,
        "jenis_kelamin": jenisKelamin,
        "alamat": alamat,
        "create_at": createAt.toIso8601String(),
        "update_at": updateAt.toIso8601String(),
      };
}
