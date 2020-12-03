import 'package:finance_app/src/config/api.dart';
import 'package:finance_app/src/model/user.dart';
import 'package:finance_app/src/provider/default_response.dart';
import 'package:finance_app/src/provider/shared_preference.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  DataShared dataShared = DataShared();
  MyResponse myResponse = MyResponse();

  Future<bool> onRegister(User model) async {
    final response = await http.post(Api.register, body: {
      'email': model.email,
      'nama': model.namaLengkap,
      'password': model.password,
    });
    return myResponse.boolResponse(response);
  }

  Future<User> onUpdate(User model) async {
    final response = await http.post(Api.updateProfil, body: {
      'email': model.email,
      'idUser': model.idUser.toString(),
      'nama': model.namaLengkap,
      'alamat': model.alamat,
      'jenisKelamin': model.jenisKelamin,
    });
    final user = await myResponse.userResponse(response);
    return user;
  }

  Future<User> onLogin(User model) async {
    final response = await http.post(Api.login, body: {
      'email': model.email,
      'password': model.password,
    });
    final user = await myResponse.userResponse(response);
    return user;
  }
}
