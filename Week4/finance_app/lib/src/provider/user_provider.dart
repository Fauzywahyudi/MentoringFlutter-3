import 'package:finance_app/src/config/api.dart';
import 'package:finance_app/src/model/user.dart';
import 'package:finance_app/src/provider/default_response.dart';
import 'package:finance_app/src/provider/shared_preference.dart';
import 'package:finance_app/src/widget/toast.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  DataShared dataShared = DataShared();
  MyToast toast = MyToast();
  MyResponse myResponse = MyResponse();

  Future<bool> onRegister(User user) async {
    final response = await http.post(Api.register, body: {
      'email': user.email,
      'nama': user.namaLengkap,
      'password': user.password,
    });
    return myResponse.boolResponse(response);
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
