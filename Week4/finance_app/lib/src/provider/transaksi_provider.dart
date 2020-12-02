import 'package:finance_app/src/config/api.dart';
import 'package:finance_app/src/model/transaksi.dart';
import 'package:finance_app/src/provider/default_response.dart';
import 'package:finance_app/src/provider/shared_preference.dart';
import 'package:http/http.dart' as http;

class TransaksiProvider {
  DataShared dataShared = DataShared();
  MyResponse myResponse = MyResponse();

  Future<List<Transaksi>> getTransaksi(String tipe, String value) async {
    final idUser = await dataShared.getId();
    final response = await http.post(Api.getTransaksi, body: {
      'id_user': idUser.toString(),
      'value': value,
      'tipe': tipe,
    });
    return myResponse.listTransaksiResponse(response);
  }
}
