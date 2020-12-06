import 'package:go_healthy/src/config/api.dart';
import 'package:go_healthy/src/model/berita.dart';
import 'package:go_healthy/src/provider/default_response.dart';
import 'package:go_healthy/src/provider/shared_preference.dart';
import 'package:http/http.dart' as http;

class BeritaProvider {
  DataShared dataShared = DataShared();
  MyResponse myResponse = MyResponse();

  Future<List<Berita>> getBerita() async {
    final response = await http.get(Api.getBerita);
    return myResponse.listBeritaResponse(response);
  }
}
