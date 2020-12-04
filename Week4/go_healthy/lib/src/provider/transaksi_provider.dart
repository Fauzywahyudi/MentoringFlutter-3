import 'package:go_healthy/src/config/api.dart';
import 'package:go_healthy/src/model/transaksi.dart';
import 'package:go_healthy/src/model/user.dart';
import 'package:go_healthy/src/provider/default_response.dart';
import 'package:go_healthy/src/provider/shared_preference.dart';
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

  Future<User> addTransaksi(Transaksi model) async {
    final idUser = await dataShared.getId();
    final response = await http.post(Api.addTransaksi, body: {
      'id_user': idUser.toString(),
      'jumlah': model.jumlahTransaksi.toString(),
      'jenis': model.jenisTransaksi,
      'deskripsi': model.deskripsi,
    });
    return myResponse.userResponse(response);
  }

  Future<User> deleteTransaksi(Transaksi model) async {
    final idUser = await dataShared.getId();
    final response = await http.post(Api.deleteTransaksi, body: {
      'id_user': idUser.toString(),
      'id_transaksi': model.idTransaksi.toString(),
      'jumlah': model.jumlahTransaksi.toString(),
      'jenis': model.jenisTransaksi,
    });
    return myResponse.userResponse(response);
  }
}
