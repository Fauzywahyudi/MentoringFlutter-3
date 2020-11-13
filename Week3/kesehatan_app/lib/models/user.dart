class User {
  int idUser;
  String username;
  String namaLengkap;
  String jk;
  String alamat;
  String createAt;

  User({
    this.idUser,
    this.username,
    this.namaLengkap,
    this.jk,
    this.alamat,
    this.createAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        idUser: int.parse(json["id_user"]),
        username: json["username"],
        namaLengkap: json["nama_lengkap"],
        jk: json["jk"],
        alamat: json["alamat"],
        createAt: json["create_at"],
      );

  Map<String, dynamic> toJson() => {
        "id_user": idUser,
        "username": username,
        "nama_lengkap": namaLengkap,
        "jk": jk,
        "alamat": alamat,
        "create_at": createAt,
      };
}
