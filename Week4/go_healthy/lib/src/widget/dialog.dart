import 'package:go_healthy/src/model/user.dart';
import 'package:go_healthy/src/provider/shared_preference.dart';
import 'package:go_healthy/src/provider/user_provider.dart';
import 'package:go_healthy/src/theme/decoration.dart';
import 'package:go_healthy/src/validation/register_validation.dart';
import 'package:flutter/material.dart';
import 'package:go_healthy/src/widget/toast.dart';

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
    if (_valJenis == 'Perempuan') _color = Colors.red;
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
                                  activeColor: Colors.green,
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
              "Confirm",
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

class DialogEditPassword extends StatefulWidget {
  @override
  _DialogEditPasswordState createState() => _DialogEditPasswordState();
}

class _DialogEditPasswordState extends State<DialogEditPassword>
    with RegisterValidation {
  final formKey = GlobalKey<FormState>();
  var _tecPassLama = TextEditingController();
  var _tecPassBaru = TextEditingController();

  String _passLama;
  String _passBaru;

  bool _obscLama = true;
  bool _obscBaru = true;

  IconData get _iconLama => _obscLama ? Icons.visibility : Icons.visibility_off;
  IconData get _iconBaru => _obscBaru ? Icons.visibility : Icons.visibility_off;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.red,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      contentPadding: EdgeInsets.symmetric(horizontal: 30),
      title: Text('Ganti Password', style: textWhite),
      actions: [
        FlatButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: textWhite,
            )),
        FlatButton(
            onPressed: () => onConfirm(),
            child: Text(
              'Confirm',
              style: textWhite,
            )),
        SizedBox(width: 10),
      ],
      content: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 20),
              TextFormField(
                controller: _tecPassLama,
                obscureText: _obscLama,
                decoration: inputDecoration('Old Password').copyWith(
                  suffixIcon: IconButton(
                      icon: Icon(_iconLama), onPressed: setObscureLama),
                ),
                validator: validatePassword,
                onSaved: (value) {
                  _passLama = value;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _tecPassBaru,
                obscureText: _obscBaru,
                decoration: inputDecoration('New Password').copyWith(
                  suffixIcon: IconButton(
                      icon: Icon(_iconBaru), onPressed: setObscureBaru),
                ),
                validator: validatePassword,
                onSaved: (value) {
                  _passBaru = value;
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void onConfirm() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      UserProvider provider = UserProvider();
      final response = await provider.onEditPassword(_passLama, _passBaru);
      if (response != null) {
        DataShared dataShared = DataShared();
        await dataShared.setUserPref(response);
        Navigator.pop(context);
      }
    }
  }

  void setObscureLama() => setState(() => _obscLama = !_obscLama);
  void setObscureBaru() => setState(() => _obscBaru = !_obscBaru);
}
