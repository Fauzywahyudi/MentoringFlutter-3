import 'package:kesehatan_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataShared {
  Future<int> getId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int idUser = sharedPreferences.getInt("id");
    return idUser;
  }

  Future<int> getValue() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int value = sharedPreferences.getInt("value");
    return value;
  }

  Future<bool> getValueOnboarding() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool value = sharedPreferences.getBool("onboarding");
    return value;
  }

  Future setValueOnboarding(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("onboarding", value);
  }

  Future<User> getDataPrefUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    User user;
    int id = sharedPreferences.getInt("id");
    String username = sharedPreferences.getString("username");
    String nama = sharedPreferences.getString("nama");
    String jk = sharedPreferences.getString("jk");
    String alamat = sharedPreferences.getString("alamat");
    String createAt = sharedPreferences.getString("create_at");
    user = User(
        idUser: id,
        username: username,
        namaLengkap: nama,
        jk: jk,
        alamat: alamat,
        createAt: createAt);
    return user;
  }

  Future saveDataPrefUser(int value, User user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt("value", value);
    sharedPreferences.setInt("id", user.idUser);
    sharedPreferences.setString("username", user.username);
    sharedPreferences.setString("nama", user.namaLengkap);
    sharedPreferences.setString("jk", user.jk);
    sharedPreferences.setString("alamat", user.alamat);
    sharedPreferences.setString("create_at", user.createAt);
  }

  Future logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt("value", null);
  }
}
