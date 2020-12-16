import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_healthy/src/config/api.dart';
import 'package:go_healthy/src/config/router.gr.dart';
import 'package:go_healthy/src/model/berita.dart';
import 'package:go_healthy/src/provider/berita_provider.dart';
import 'package:go_healthy/src/theme/decoration.dart';
import 'package:go_healthy/src/validation/berita_validation.dart';
import 'package:go_healthy/src/widget/background.dart';
import 'package:go_healthy/src/widget/button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class AddBerita extends StatefulWidget {
  @override
  _AddBeritaState createState() => _AddBeritaState();
}

class _AddBeritaState extends State<AddBerita> with BeritaValidation {
  final formKey = GlobalKey<FormState>();
  final picker = ImagePicker();
  final dio = Dio();
  var _tecJudul = TextEditingController();
  var _tecIsi = TextEditingController();
  var _tecPenulis = TextEditingController();
  var _tecSumber = TextEditingController();

  String _judul;
  String _isi;
  String _penulis;
  String _sumber;
  String _filename;
  Response response;
  File _image;
  bool _isLoading = false;
  String progress;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: _isLoading
          ? null
          : FloatingActionButton(
              onPressed: () => onSave(),
              child: Icon(Icons.check),
            ),
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.grey[200],
        child: Stack(
          children: [
            BackGround(
              title: 'Tambah Berita',
              height: 150,
            ),
            BackIconButton(
              onPressed: () => Navigator.pop(context, false),
            ),
            buildImagePicker(size, context),
            Container(
              margin: EdgeInsets.only(top: 320),
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: size.width,
              height: size.height - 320,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _tecJudul,
                        decoration: inputDecoration('Judul'),
                        validator: validateJudul,
                        onSaved: (value) {
                          _judul = value;
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        controller: _tecPenulis,
                        decoration: inputDecoration('Penulis'),
                        validator: validatePenulis,
                        onSaved: (value) {
                          _penulis = value;
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        controller: _tecSumber,
                        textInputAction: TextInputAction.next,
                        decoration: inputDecoration('Sumber'),
                        validator: validateSumber,
                        onSaved: (value) {
                          _sumber = value;
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        controller: _tecIsi,
                        minLines: 5,
                        maxLines: 10,
                        decoration: inputDecoration('Isi'),
                        validator: validateIsi,
                        onSaved: (value) {
                          _isi = value;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _isLoading ? buildLoading(context) : Container(),
            _isLoading ? _buildProgress() : Container(),
          ],
        ),
      ),
    );
  }

  Container _buildProgress() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Center(
        child: Text(
          basename("\n\nProgress: $progress"),
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Container buildImagePicker(Size size, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100, right: 20, left: 20),
      width: size.width,
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Colors.white),
      child: Stack(
        children: [
          Container(
            width: size.width,
            child: _image == null ? _noLogoPicked() : _imagePicked(size),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: InkWell(
              onTap: () => getImage(context),
              child: Container(
                height: 50,
                width: 50,
                decoration: circleContainer,
                child: Center(
                  child: Icon(
                    Icons.image,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _imagePicked(Size size) => Container(
        width: size.width,
        child: ClipRRect(
          child: Image.file(
            _image,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      );

  Center _noLogoPicked() {
    return Center(
      child: Text(
        'No Selected \nImage',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.grey),
      ),
    );
  }

  Future getImage(BuildContext context) async {
    var imgSrc;
    await showDialog(
        context: context,
        child: AlertDialog(
          title: Text('Select Image By'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.camera),
                  title: Text('Kamera'),
                  onTap: () {
                    Navigator.pop(context);
                    imgSrc = ImageSource.camera;
                  },
                ),
                ListTile(
                  leading: Icon(Icons.image),
                  title: Text('Galery'),
                  onTap: () {
                    Navigator.pop(context);
                    imgSrc = ImageSource.gallery;
                  },
                ),
              ],
            ),
          ),
        ));
    final pickedFile = await picker.getImage(source: imgSrc);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        final split = pickedFile.path.split('/');
        _filename = split.last;
      } else {
        print('No image selected.');
      }
    });
  }

  Future<bool> uploadFile() async {
    FormData formdata = FormData.fromMap({
      "file": await MultipartFile.fromFile(
        _image.path,
        filename: _filename,
        //show only filename from path
      ),
    });
    response = await dio.post(
      Api.uploadImgBerita,
      data: formdata,
      onSendProgress: (int sent, int total) {
        String percentage = (sent / total * 100).toStringAsFixed(2);
        setState(() {
          progress = "$sent" +
              " Bytes of " "$total Bytes - " +
              percentage +
              " % uploaded";
        });
      },
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  void onSave() async {
    if (formKey.currentState.validate() && _image != null) {
      formKey.currentState.save();
      setLoading();
      final isUploaded = await uploadFile();
      if (isUploaded) {
        final model = Berita(
            judul: _judul,
            isiBerita: _isi,
            penulis: _penulis,
            sumber: _sumber,
            image: _filename);
        BeritaProvider provider = BeritaProvider();
        final result = await provider.addBerita(model);
        if (result) {
          Router.navigator.pop(true);
        }
      }
      setLoading();
    }
  }

  void setLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Widget buildLoading(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.black38,
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
