import 'package:go_healthy/src/config/api.dart';
import 'package:go_healthy/src/model/user.dart';
import 'package:go_healthy/src/provider/default_response.dart';
import 'package:go_healthy/src/provider/shared_preference.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  DataShared dataShared = DataShared();
  MyResponse myResponse = MyResponse();
  static const _email = 'email';
  static const _nama = 'nama';
  static const _password = 'password';
  static const _idUser = 'idUser';
  static const _alamat = 'alamat';
  static const _jenisKelamin = 'jenisKelamin';

  Future<bool> onRegister(User model) async {
    final response = await http.post(Api.register, body: {
      _email: model.email,
      _nama: model.namaLengkap,
      _password: model.password,
    });
    return myResponse.boolResponse(response);
  }

  Future<User> onUpdate(User model) async {
    final response = await http.post(Api.updateProfil, body: {
      _email: model.email,
      _idUser: model.idUser.toString(),
      _nama: model.namaLengkap,
      _alamat: model.alamat,
      _jenisKelamin: model.jenisKelamin,
    });
    final user = await myResponse.userResponse(response);
    return user;
  }

  Future<User> onLogin(User model) async {
    final response = await http.post(Api.login, body: {
      _email: model.email,
      _password: model.password,
    });
    final user = await myResponse.userResponse(response);
    return user;
  }
}
