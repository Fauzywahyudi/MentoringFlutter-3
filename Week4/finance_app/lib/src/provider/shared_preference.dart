import 'package:finance_app/src/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataShared {
  static const _id = 'id';
  static const _value = 'value';
  static const _nama = 'nama';
  static const _data = 'data';
  static const _uang = 'uang';

  Future setUserPref(User user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String data = userToJson([user]);
    sharedPreferences.setInt(_value, 1);
    sharedPreferences.setInt(_value, user.uang);
    sharedPreferences.setInt(_id, user.idUser);
    sharedPreferences.setString(_nama, user.namaLengkap);
    sharedPreferences.setString(_data, data);
  }

  Future<int> getId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int idUser = sharedPreferences.getInt(_id);
    return idUser;
  }

  Future<int> getValue() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int value = sharedPreferences.getInt(_value);
    return value;
  }

  Future<int> getUang() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int value = sharedPreferences.getInt(_uang);
    return value;
  }

  Future<String> getNama() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String value = sharedPreferences.getString(_nama);
    return value;
  }

  Future<String> getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String value = sharedPreferences.getString(_data);
    return value;
  }

  Future clearAll() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt(_value, null);
    sharedPreferences.setInt(_id, null);
    sharedPreferences.setInt(_uang, null);
    sharedPreferences.setString(_nama, null);
    sharedPreferences.setString(_data, null);
  }
}
