import 'package:go_healthy/src/config/api.dart';
import 'package:go_healthy/src/model/istilah.dart';
import 'package:go_healthy/src/provider/default_response.dart';
import 'package:go_healthy/src/provider/shared_preference.dart';
import 'package:http/http.dart' as http;

class IstilahProvider {
  DataShared dataShared = DataShared();
  MyResponse myResponse = MyResponse();

  static const _keyword = 'keyword';
  static const _id = 'id';
  static const _istilah = 'istilah';
  static const _penjelasan = 'penjelasan';

  Future<List<Istilah>> getIstilah(String keyword) async {
    final response = await http.post(Api.getIstilah, body: {
      _keyword: keyword,
    });
    return myResponse.listIstilahResponse(response);
  }

  Future<bool> addIstilah(Istilah model) async {
    final response = await http.post(Api.addIstilah, body: {
      _istilah: model.namaIstilah,
      _penjelasan: model.penjelasan,
    });
    return myResponse.boolResponse(response);
  }

  Future<bool> updateIstilah(Istilah model) async {
    final response = await http.post(Api.updateIstilah, body: {
      _id: model.idIstilah.toString(),
      _istilah: model.namaIstilah,
      _penjelasan: model.penjelasan,
    });
    return myResponse.boolResponse(response);
  }

  Future<bool> deleteIstilah(Istilah model) async {
    final response = await http.post(Api.deleteIstilah, body: {
      _id: model.idIstilah.toString(),
    });
    return myResponse.boolResponse(response);
  }
}
