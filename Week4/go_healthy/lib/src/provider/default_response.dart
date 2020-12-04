import 'dart:convert';

import 'package:go_healthy/src/model/informasi.dart';
import 'package:go_healthy/src/model/transaksi.dart';
import 'package:go_healthy/src/model/user.dart';
import 'package:go_healthy/src/provider/shared_preference.dart';
import 'package:go_healthy/src/widget/toast.dart';
import 'package:http/http.dart';

class MyResponse {
  MyToast toast = MyToast();
  DataShared dataShared = DataShared();
  static const _failConnect = 'Koneksi gagal';
  static const _message = 'message';
  static const _value = 'value';
  static const _data = 'data';

  bool boolResponse(Response response) {
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      int value = result[_value];
      if (value == 1) {
        toast.success(result[_message]);
        return true;
      } else if (value == 2) {
        toast.info(result[_message]);
        return false;
      } else {
        toast.failed(result[_message]);
        return false;
      }
    } else {
      toast.failed(_failConnect);
      return false;
    }
  }

  Future<User> userResponse(Response response) async {
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      int value = result[_value];
      if (value == 1) {
        final user = User.fromJson(result[_data]);
        await dataShared.setUserPref(user);
        return user;
      } else if (value == 2) {
        toast.failed(result[_message]);
        return null;
      } else {
        toast.failed(result[_message]);
        return null;
      }
    } else {
      toast.failed(_failConnect);
      return null;
    }
  }

  Future<List<Transaksi>> listTransaksiResponse(Response response) async {
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      int value = result[_value];
      if (value == 1) {
        final list = transaksiFromJson(jsonEncode(result[_data]));
        return list;
      } else {
        toast.failed(result[_message]);
        return null;
      }
    } else {
      toast.failed(_failConnect);
      return null;
    }
  }

  Future<List<Informasi>> listInformasiResponse(Response response) async {
    if (response.statusCode == 200) {
      final result = informasiFromJson(response.body);
      return result;
    } else {
      toast.failed(_failConnect);
      return null;
    }
  }
}
