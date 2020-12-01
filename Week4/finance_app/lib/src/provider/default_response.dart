import 'dart:convert';

import 'package:finance_app/src/widget/toast.dart';
import 'package:http/http.dart';

class MyResponse {
  MyToast toast = MyToast();

  bool boolResponse(Response response) {
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      int value = result['value'];
      if (value == 1) {
        toast.success(result['message']);
        return true;
      } else if (value == 2) {
        toast.info(result['message']);
        return false;
      } else {
        toast.failed(result['message']);
        return false;
      }
    } else {
      toast.failed('Koneksi gagal');
      return false;
    }
  }
}
