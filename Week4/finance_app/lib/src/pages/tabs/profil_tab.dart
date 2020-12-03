import 'package:finance_app/src/config/router.gr.dart';
import 'package:finance_app/src/provider/shared_preference.dart';
import 'package:finance_app/src/theme/decoration.dart';
import 'package:finance_app/src/widget/background.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilTab extends StatefulWidget {
  @override
  _ProfilTabState createState() => _ProfilTabState();
}

class _ProfilTabState extends State<ProfilTab> {
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
          margin: EdgeInsets.only(top: 150),
          width: size.width,
          height: size.height,
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
                            title: Text('Fauzy Wahyudi'),
                            subtitle: Text('Nama'),
                          ),
                          ListTile(
                            title: Text('Fauzy Wahyudi'),
                            subtitle: Text('Email'),
                          ),
                          ListTile(
                            title: Text('Fauzy Wahyudi'),
                            subtitle: Text('Jenis Kelamin'),
                          ),
                          ListTile(
                            title: Text('Fauzy Wahyudi'),
                            subtitle: Text('Alamat'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    buildListTile(
                        'Edit Profil', _onLogout, FontAwesomeIcons.edit),
                    SizedBox(height: 15),
                    buildListTile(
                        'Logout', _onLogout, FontAwesomeIcons.powerOff),
                  ],
                ),
              )
            ],
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
}
