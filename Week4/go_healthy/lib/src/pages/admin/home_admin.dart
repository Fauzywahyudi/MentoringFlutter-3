import 'package:flutter/material.dart';
import 'package:go_healthy/src/config/router.gr.dart';
import 'package:go_healthy/src/provider/shared_preference.dart';
import 'package:go_healthy/src/theme/decoration.dart';
import 'package:go_healthy/src/widget/background.dart';
import 'package:go_healthy/src/widget/my_awesome_dialog.dart';

class HomeAdmin extends StatefulWidget {
  @override
  _HomeAdminState createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  String _nama = '';
  final dataShared = DataShared();

  @override
  void initState() {
    getNama();
    super.initState();
  }

  void getNama() async {
    final nama = await dataShared.getNama();
    setState(() {
      _nama = 'Welcome $nama';
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.grey[200],
        child: Column(
          children: [
            BackGround(
              title: 'Home',
              subTitle: _nama,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: size.width,
              height: size.height - 270,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Row(
                      children: [
                        _MenuHome(
                          title: 'Istilah \Kesehatan',
                          image: 'icon_kesehatan.png',
                          onTap: () => Router.navigator.pushNamed(
                              Router.istilahKesehatan,
                              arguments: true),
                        ),
                        _MenuHome(
                          title: 'Berita \nKesehatan',
                          image: 'news.jpg',
                          onTap: () => Router.navigator.pushNamed(
                              Router.beritaKesehatan,
                              arguments: true),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        _MenuHome(
                          title: 'Tips \nKesehatan',
                          image: 'news.jpg',
                          onTap: () => Router.navigator
                              .pushNamed(Router.infoTab, arguments: true),
                        ),
                        _MenuHome(
                          title: 'Log Out \n',
                          image: 'logout.png',
                          onTap: () => awesomeLogout(context, 'Logout',
                              'Yakin untuk Logout?', _onLogout),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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

class _MenuHome extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String image;
  const _MenuHome({
    @required this.onTap,
    @required this.title,
    @required this.image,
  });
  static const uri = 'assets/images/';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: borRad30,
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  offset: Offset(1, 1),
                  color: Colors.red,
                ),
              ]),
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: circleContainer.copyWith(
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage(uri + image),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: borRad30,
                ),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: textMenu.copyWith(color: Colors.red),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
