import 'package:finance_app/src/config/router.gr.dart';
import 'package:finance_app/src/provider/shared_preference.dart';
import 'package:finance_app/src/theme/decoration.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilTab extends StatefulWidget {
  @override
  _ProfilTabState createState() => _ProfilTabState();
}

class _ProfilTabState extends State<ProfilTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                pinned: true,
                floating: true,
                snap: true,
                elevation: 0,
                title: Text('Profile'),
                centerTitle: true,
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(),
              ),
            ];
          },
          body: Container(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(FontAwesomeIcons.powerOff, color: Colors.red),
                  title: Text(
                    'Log Out',
                    style: textMenu.copyWith(color: Colors.red),
                  ),
                  onTap: _onLogout,
                ),
              ],
            ),
          )),
    );
  }

  void _onLogout() async {
    DataShared dataShared = DataShared();
    await dataShared.clearAll();
    Router.navigator
        .pushNamedAndRemoveUntil(Router.loginPage, (route) => false);
  }
}
