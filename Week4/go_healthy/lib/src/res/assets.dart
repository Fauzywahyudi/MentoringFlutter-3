import 'package:go_healthy/src/model/user.dart';

const String bg1 = "assets/images/bg1.jpg";
const String bg2 = "assets/images/bg2.jpeg";
const String appLogo = 'assets/images/ic_launcher.png';

User getInfoAdmin() {
  User user = User();
  user.idUser = 0;
  user.email = 'admin@gmail.com';
  user.namaLengkap = 'Administrator';
  user.createAt = DateTime.now();
  user.updateAt = DateTime.now();
  user.alamat = '';
  user.jenisKelamin = '';
  user.password = 'administrator';
  return user;
}
