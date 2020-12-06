import 'package:go_healthy/src/config/api.dart';
import 'package:go_healthy/src/model/istilah.dart';
import 'package:go_healthy/src/provider/default_response.dart';
import 'package:go_healthy/src/provider/shared_preference.dart';
import 'package:http/http.dart' as http;

class IstilahProvider {
  DataShared dataShared = DataShared();
  MyResponse myResponse = MyResponse();

  static const _keyword = 'keyword';

  Future<List<Istilah>> getIstilah(String keyword) async {
    final response = await http.post(Api.getIstilah, body: {
      _keyword: keyword,
    });
    return myResponse.listIstilahResponse(response);
  }
}
