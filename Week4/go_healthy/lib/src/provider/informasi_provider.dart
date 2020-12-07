import 'package:go_healthy/src/config/api.dart';
import 'package:go_healthy/src/model/informasi.dart';
import 'package:go_healthy/src/model/tips.dart';
import 'package:go_healthy/src/provider/default_response.dart';
import 'package:go_healthy/src/provider/shared_preference.dart';
import 'package:http/http.dart' as http;

class InformasiProvider {
  DataShared dataShared = DataShared();
  MyResponse myResponse = MyResponse();
  static const _idTips = 'id_tips';

  Future<List<Tips>> getTips() async {
    final response = await http.get(Api.getTips);
    return myResponse.listTipsResponse(response);
  }

  Future<List<Informasi>> getInformasi(String idTips) async {
    final response = await http.post(Api.getInformasi, body: {
      _idTips: idTips,
    });
    print(response.body);
    return myResponse.listInformasiResponse(response);
  }
}
