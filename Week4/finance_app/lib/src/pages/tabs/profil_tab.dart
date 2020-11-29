import 'package:flutter/material.dart';

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
          body: Container()),
    );
  }
}
