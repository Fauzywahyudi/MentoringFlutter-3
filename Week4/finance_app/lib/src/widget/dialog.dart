import 'package:finance_app/src/model/transaksi.dart';
import 'package:finance_app/src/model/user.dart';
import 'package:finance_app/src/provider/shared_preference.dart';
import 'package:finance_app/src/provider/transaksi_provider.dart';
import 'package:finance_app/src/provider/user_provider.dart';
import 'package:finance_app/src/theme/decoration.dart';
import 'package:finance_app/src/validation/register_validation.dart';
import 'package:finance_app/src/validation/transaksi_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class DialogAddTransaksi extends StatefulWidget {
  final int uang;

  const DialogAddTransaksi({@required this.uang});
  @override
  _DialogAddTransaksiState createState() => _DialogAddTransaksiState();
}

class _DialogAddTransaksiState extends State<DialogAddTransaksi>
    with TransaksiValidation {
  final formKey = GlobalKey<FormState>();
  String _valRadio = 'in';
  Color _color = Colors.green;
  var _tecJumlah = MoneyMaskedTextController(
      thousandSeparator: ',', decimalSeparator: '.', initialValue: 0);
  var _tecDeskripsi = TextEditingController();
  String _jumlah;
  String _deskripsi;

  String _errorJumlah;
  @override
  void initState() {
    _errorJumlah = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: _color,
      contentPadding: EdgeInsets.symmetric(horizontal: 30),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      content: Container(
        height: MediaQuery.of(context).size.height * 0.40,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: 20),
                TextFormField(
                  controller: _tecJumlah,
                  keyboardType: TextInputType.number,
                  decoration: inputDecoration('Jumlah')
                      .copyWith(errorText: _errorJumlah),
                  onChanged: onChangeJumlah,
                  validator: validateJumlah,
                  onSaved: (value) {
                    _jumlah = value;
                  },
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Jenis', style: textLabel),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Text('In'),
                              Radio(
                                  value: 'in',
                                  groupValue: _valRadio,
                                  onChanged: _onChangeRadio),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Out'),
                              Radio(
                                  activeColor: Colors.red,
                                  value: 'out',
                                  groupValue: _valRadio,
                                  onChanged: _onChangeRadio),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _tecDeskripsi,
                  decoration: inputDecoration('Deskripsi'),
                  validator: validateDeskripsi,
                  onSaved: (value) {
                    _deskripsi = value;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      title: Text("Add Transaction", style: textWhite),
      actions: <Widget>[
        RaisedButton(
            child: Text(
              "Konfirmasi",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            onPressed: onPressed),
        SizedBox(width: 10),
      ],
    );
  }

  void onChangeJumlah(String value) {
    String newValue = value.replaceAll(',', '');
    if (double.parse(newValue) > double.parse(widget.uang.toString()) &&
        _valRadio == 'out') {
      setState(() {
        _errorJumlah = 'Saldo tidak cukup';
      });
    } else {
      setState(() {
        _errorJumlah = null;
      });
    }
  }

  void _onChangeRadio(String value) => setState(() {
        _valRadio = value;
        _color = value == 'in' ? Colors.green : Colors.red;
        onChangeJumlah(_tecJumlah.text);
      });

  void onPressed() async {
    if (formKey.currentState.validate() &&
        _valRadio != null &&
        _errorJumlah == null) {
      formKey.currentState.save();
      TransaksiProvider provider = TransaksiProvider();
      var separator = _jumlah.split('.');
      String newValue = separator.first.replaceAll(',', '');
      final response = await provider.addTransaksi(Transaksi(
          jumlahTransaksi: int.parse(newValue),
          jenisTransaksi: _valRadio,
          deskripsi: _deskripsi));
      if (response != null) {
        DataShared dataShared = DataShared();
        await dataShared.setUserPref(response);
        Navigator.pop(context);
      }
    }
  }
}

class DialogEditProfil extends StatefulWidget {
  final User user;

  const DialogEditProfil({@required this.user});
  @override
  _DialogEditProfilState createState() => _DialogEditProfilState();
}

class _DialogEditProfilState extends State<DialogEditProfil>
    with RegisterValidation {
  final formKey = GlobalKey<FormState>();
  String _valJenis = 'Laki-laki';
  Color _color = Colors.green;
  var _tecNama;
  var _tecEmail;
  var _tecAlamat;
  String _nama;
  String _email;
  String _alamat;
  @override
  void initState() {
    _tecNama = TextEditingController(text: widget.user.namaLengkap);
    _tecEmail = TextEditingController(text: widget.user.email);
    _tecAlamat = TextEditingController(text: widget.user.alamat);
    _valJenis = widget.user.jenisKelamin;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: _color,
      contentPadding: EdgeInsets.symmetric(horizontal: 30),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      content: Container(
        height: MediaQuery.of(context).size.height * 0.55,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: 20),
                TextFormField(
                  controller: _tecNama,
                  decoration: inputDecoration('Nama'),
                  validator: validateName,
                  onSaved: (value) {
                    _nama = value;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _tecEmail,
                  decoration: inputDecoration('Email'),
                  validator: validateEmail,
                  onSaved: (value) {
                    _email = value;
                  },
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Jenis Kelamin', style: textLabel),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Laki-laki'),
                              Radio(
                                  value: 'Laki-laki',
                                  groupValue: _valJenis,
                                  onChanged: _onChangeRadio),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Perempuan'),
                              Radio(
                                  activeColor: Colors.red,
                                  value: 'Perempuan',
                                  groupValue: _valJenis,
                                  onChanged: _onChangeRadio),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _tecAlamat,
                  decoration: inputDecoration('Alamat'),
                  validator: validateAlamat,
                  onSaved: (value) {
                    _alamat = value;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      title: Text("Add Transaction", style: textWhite),
      actions: <Widget>[
        RaisedButton(
            child: Text(
              "Konfirmasi",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            onPressed: onPressed),
        SizedBox(width: 10),
      ],
    );
  }

  void _onChangeRadio(String value) => setState(() {
        _valJenis = value;
        _color = value == 'Laki-laki' ? Colors.green : Colors.red;
      });

  void onPressed() async {
    if (formKey.currentState.validate() && _valJenis != null) {
      formKey.currentState.save();
      UserProvider provider = UserProvider();
      final response = await provider.onUpdate(User(
          idUser: widget.user.idUser,
          namaLengkap: _nama,
          email: _email,
          jenisKelamin: _valJenis,
          alamat: _alamat));
      if (response != null) {
        DataShared dataShared = DataShared();
        await dataShared.setUserPref(response);
        Navigator.pop(context);
      }
    }
  }
}
