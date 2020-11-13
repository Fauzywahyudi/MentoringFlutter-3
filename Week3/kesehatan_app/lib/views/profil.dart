import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kesehatan_app/models/user.dart';
import 'package:kesehatan_app/providers/shared_referenced.dart';
import 'package:kesehatan_app/api/web_service.dart';
import 'package:http/http.dart' as http;
import 'package:kesehatan_app/utils/toast.dart';

class ProfilPage extends StatefulWidget {
  static const routeName = '/profil';
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  DataShared _dataShared = DataShared();
  bool _isEdit = false;
  int idUser = 0;
  String nama = '';
  String username = '';
  String jk = '';
  String alamat = '';
  String createAt = '';
  int _groupValue;
  Widget get showBody => _isEdit ? _buildEditData() : _buildViewData();
  var _tecNama = TextEditingController();
  var _tecAlamat = TextEditingController();

  Widget get floating => _isEdit
      ? FloatingActionButton(
          onPressed: () => onClickFabSave(),
          child: Icon(Icons.check),
        )
      : FloatingActionButton(
          onPressed: () => onClickFabEdit(),
          child: Icon(Icons.edit),
        );

  Future<void> _getDataUser() async {
    User user = await _dataShared.getDataPrefUser();
    setState(() {
      nama = user.namaLengkap;
      username = user.username;
      jk = user.jk;
      alamat = user.alamat;
      createAt = user.createAt;
      idUser = user.idUser;
    });
  }

  @override
  void initState() {
    super.initState();
    _getDataUser();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: floating,
      appBar: AppBar(
        title: Text('Profil'),
        elevation: 0,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 100,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Center(
                  child: Text(
                    nama,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              showBody,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildViewData() {
    return Column(
      children: [
        Card(
          child: ListTile(
            title: Text(username),
            subtitle: Text('Username'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text(jk ?? '-'),
            subtitle: Text('Jenis Kelamin'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text(alamat ?? '-'),
            subtitle: Text('Alamat'),
          ),
        ),
        Card(
          child: ListTile(
            title: Text(createAt),
            subtitle: Text('Tanggal Daftar'),
          ),
        ),
      ],
    );
  }

  Widget _buildEditData() {
    return Column(
      children: [
        Card(
            child: TextField(
          controller: _tecNama,
          decoration: InputDecoration(labelText: 'Nama Lengkap'),
        )),
        Card(
            child: Row(
          children: [
            Text('Laki-laki'),
            Radio(
                value: 0,
                groupValue: _groupValue,
                onChanged: (v) => onClickRadio(v)),
            Text('Perempuan'),
            Radio(
                value: 1,
                groupValue: _groupValue,
                onChanged: (v) => onClickRadio(v)),
          ],
        )),
        Card(
            child: TextField(
          controller: _tecAlamat,
          decoration: InputDecoration(labelText: 'Alamat'),
        )),
      ],
    );
  }

  void onClickRadio(int value) {
    setState(() {
      _groupValue = value;
    });
  }

  void onClickFabEdit() {
    setState(() {
      _isEdit = !_isEdit;
      _tecNama.text = nama;
      _tecAlamat.text = alamat;
      if (jk == 'Laki-laki') _groupValue = 0;
      if (jk == 'Perempuan') _groupValue = 1;
    });
  }

  void onClickFabSave() async {
    MyToast toast = MyToast();
    if (_tecNama.text.isNotEmpty &&
        _tecAlamat.text.isNotEmpty &&
        _groupValue != null) {
      final result = await http.post(WebService.updateProfil, body: {
        'id_user': idUser.toString(),
        'nama': _tecNama.text,
        'alamat': _tecAlamat.text,
        'jk': _groupValue == 0 ? 'Laki-laki' : 'Perempuan',
      });
      if (result.statusCode == 200) {
        final response = jsonDecode(result.body);
        int value = response['value'];
        String msg = response['message'];
        if (value == 1) {
          toast.showSuccessToast(msg);
          setState(() {
            _isEdit = false;
          });
          final data = response['data'];
          print(data);
          User user = User(
            idUser: int.parse(data['id_user']),
            username: data['username'],
            namaLengkap: data['nama_lengkap'],
            jk: data['jk'],
            alamat: data['alamat'],
            createAt: data['create_at'],
          );
          _dataShared.saveDataPrefUser(value, user);
          Navigator.pop(context);
        } else {
          toast.showErrorToast(msg);
        }
      }
    } else {
      toast.showErrorToast('Isi semua data!');
    }
  }
}
