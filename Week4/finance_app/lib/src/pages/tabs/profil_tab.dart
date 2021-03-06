import 'package:finance_app/src/config/router.gr.dart';
import 'package:finance_app/src/model/user.dart';
import 'package:finance_app/src/provider/shared_preference.dart';
import 'package:finance_app/src/theme/decoration.dart';
import 'package:finance_app/src/widget/background.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:finance_app/src/widget/dialog.dart';

class ProfilTab extends StatefulWidget {
  @override
  _ProfilTabState createState() => _ProfilTabState();
}

class _ProfilTabState extends State<ProfilTab> {
  User _user = User(namaLengkap: '', email: '', jenisKelamin: '', alamat: '');

  @override
  void initState() {
    getUser();
    super.initState();
  }

  Future<void> getUser() async {
    DataShared dataShared = DataShared();
    _user = await dataShared.getData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      width: size.width,
      height: size.height,
      color: Colors.grey[100],
      child: Stack(children: [
        BackGround(
          title: 'Profile',
        ),
        Container(
          margin: EdgeInsets.only(top: 100),
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Card(
                        child: Column(
                          children: [
                            ListTile(
                              leading: Icon(Icons.person),
                              title: Text(_user.namaLengkap ?? ''),
                              subtitle: Text('Nama'),
                            ),
                            ListTile(
                              leading: Icon(Icons.email),
                              title: Text(_user.email ?? ''),
                              subtitle: Text('Email'),
                            ),
                            ListTile(
                              leading: Icon(Icons.wc),
                              title: Text(_user.jenisKelamin ?? '-'),
                              subtitle: Text('Jenis Kelamin'),
                            ),
                            ListTile(
                              leading: Icon(Icons.location_on),
                              title: Text(_user.alamat ?? '-'),
                              subtitle: Text('Alamat'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      buildListTile(
                          'Edit Profil', _onEditProfile, FontAwesomeIcons.edit),
                      SizedBox(height: 15),
                      buildListTile(
                          'Logout', _onLogout, FontAwesomeIcons.powerOff),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    ));
  }

  Widget buildListTile(String title, VoidCallback onTap, IconData icon) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Colors.green),
        title: Text(
          title,
          style: textMenu.copyWith(color: Colors.green),
        ),
        onTap: onTap,
      ),
    );
  }

  void _onLogout() async {
    DataShared dataShared = DataShared();
    await dataShared.clearAll();
    Router.navigator
        .pushNamedAndRemoveUntil(Router.loginPage, (route) => false);
  }

  Future _onEditProfile() async {
    await showDialog(
        context: context,
        builder: (context) => DialogEditProfil(
              user: _user,
            ));
    getUser();
  }
}
