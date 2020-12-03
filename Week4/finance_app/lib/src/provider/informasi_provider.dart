import 'package:finance_app/src/config/api.dart';
import 'package:finance_app/src/model/informasi.dart';
import 'package:finance_app/src/provider/default_response.dart';
import 'package:finance_app/src/provider/shared_preference.dart';
import 'package:http/http.dart' as http;

class InformasiProvider {
  DataShared dataShared = DataShared();
  MyResponse myResponse = MyResponse();

  Future<List<Informasi>> getInformasi() async {
    final response = await http.get(Api.getInformasi);
    return myResponse.listInformasiResponse(response);
  }
}
