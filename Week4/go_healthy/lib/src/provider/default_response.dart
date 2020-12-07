import 'dart:convert';

import 'package:go_healthy/src/model/berita.dart';
import 'package:go_healthy/src/model/informasi.dart';
import 'package:go_healthy/src/model/istilah.dart';
import 'package:go_healthy/src/model/tips.dart';
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
    print(response.statusCode);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      int value = result[_value];
      if (value == 1) {
        final user = User.fromJson(result[_data]);
        await dataShared.setUserPref(user);
        toast.success(result[_message]);
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
      final result = jsonDecode(response.body);
      int value = result[_value];
      if (value == 1) {
        final list = informasiFromJson(jsonEncode(result[_data]));
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

  Future<List<Istilah>> listIstilahResponse(Response response) async {
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      int value = result[_value];
      if (value == 1) {
        final list = istilahFromJson(jsonEncode(result[_data]));
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

  Future<List<Berita>> listBeritaResponse(Response response) async {
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      int value = result[_value];
      if (value == 1) {
        final list = beritaFromJson(jsonEncode(result[_data]));
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

  Future<List<Tips>> listTipsResponse(Response response) async {
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      int value = result[_value];
      if (value == 1) {
        final list = tipsFromJson(jsonEncode(result[_data]));
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
}
