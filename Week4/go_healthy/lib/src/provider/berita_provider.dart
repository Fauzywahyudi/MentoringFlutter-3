import 'package:go_healthy/src/config/api.dart';
import 'package:go_healthy/src/model/berita.dart';
import 'package:go_healthy/src/provider/default_response.dart';
import 'package:go_healthy/src/provider/shared_preference.dart';
import 'package:http/http.dart' as http;

class BeritaProvider {
  DataShared dataShared = DataShared();
  MyResponse myResponse = MyResponse();

  static const _id = 'id';
  static const _judul = 'judul';
  static const _isi = 'isi';
  static const _penulis = 'penulis';
  static const _sumber = 'sumber';
  static const _image = 'image';

  Future<List<Berita>> getBerita() async {
    final response = await http.get(Api.getBerita);
    return myResponse.listBeritaResponse(response);
  }

  Future<bool> addBerita(Berita model) async {
    final response = await http.post(Api.addBerita, body: {
      _judul: model.judul,
      _isi: model.isiBerita,
      _penulis: model.penulis,
      _sumber: model.sumber,
      _image: model.image,
    });
    return myResponse.boolResponse(response);
  }

  Future<bool> updateBerita(Berita model) async {
    final response = await http.post(Api.updateBerita, body: {
      _id: model.idBerita.toString(),
      _judul: model.judul,
      _isi: model.isiBerita,
      _penulis: model.penulis,
      _sumber: model.sumber,
      _image: model.image,
    });
    return myResponse.boolResponse(response);
  }

  Future<bool> deleteBerita(Berita model) async {
    final response = await http.post(Api.deleteBerita, body: {
      _id: model.idBerita.toString(),
    });
    return myResponse.boolResponse(response);
  }
}
