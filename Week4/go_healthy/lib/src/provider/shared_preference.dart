import 'package:go_healthy/src/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataShared {
  static const _id = 'id';
  static const _value = 'value';
  static const _nama = 'nama';
  static const _data = 'data';
  static const _onboard = 'onboard';

  Future setUserPref(User user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String data = userToJson([user]);
    sharedPreferences.setInt(_value, 1);
    sharedPreferences.setInt(_id, user.idUser);
    sharedPreferences.setString(_nama, user.namaLengkap);
    sharedPreferences.setString(_data, data);
  }

  Future setOnboarding(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(_onboard, value);
  }

  Future<bool> getOnboarding() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(_onboard);
  }

  Future<int> getId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(_id);
  }

  Future<int> getValue() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(_value);
  }

  Future<String> getNama() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_nama);
  }

  Future<User> getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String data = sharedPreferences.getString(_data);
    final list = userFromJson(data);
    return list[0];
  }

  Future clearAll() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt(_value, null);
    sharedPreferences.setInt(_id, null);
    sharedPreferences.setString(_nama, null);
    sharedPreferences.setString(_data, null);
  }
}
