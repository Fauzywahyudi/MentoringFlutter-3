import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
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
                title: Text('Home'),
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
