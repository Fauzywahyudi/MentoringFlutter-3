import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_healthy/src/model/istilah.dart';
import 'package:go_healthy/src/provider/istilah_provider.dart';
import 'package:go_healthy/src/theme/decoration.dart';
import 'package:go_healthy/src/widget/background.dart';
import 'package:go_healthy/src/widget/button.dart';
import 'package:go_healthy/src/widget/text.dart';
import 'package:google_fonts/google_fonts.dart';

class IstilahKesehatan extends StatefulWidget {
  @override
  _IstilahKesehatanState createState() => _IstilahKesehatanState();
}

class _IstilahKesehatanState extends State<IstilahKesehatan> {
  String _currentSearch = "";
  final asset = "assets/images/";
  var tecSearch = TextEditingController();
  final istilahProv = IstilahProvider();

  Future<Null> handleRefresh() async {
    Completer<Null> completer = new Completer<Null>();
    new Future.delayed(new Duration(milliseconds: 500)).then((_) {
      completer.complete();
      setState(() {});
    });
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.grey[200],
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Stack(
            children: [
              BackGround(
                title: 'Istilah Kesehatan',
              ),
              BackIconButton(
                onPressed: () => Navigator.pop(context),
              ),
              Container(
                margin: EdgeInsets.only(top: 100),
                width: size.width,
                child: Stack(
                  children: [
                    _buildBody(),
                    _buildSearchInput(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      margin: EdgeInsets.only(top: 100),
      height: MediaQuery.of(context).size.height - 220,
      child: FutureBuilder<List<Istilah>>(
        future: istilahProv.getIstilah(_currentSearch),
        builder: (context, snapshot) {
          var state = snapshot.connectionState;
          if (state != ConnectionState.done) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return snapshot.data.isEmpty
                ? NoData(
                    msg: 'Tidak Ada Data!',
                  )
                : _buildListBuilder(snapshot);
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return Text('');
          }
        },
      ),
    );
  }

  Widget _buildListBuilder(AsyncSnapshot<List<Istilah>> snapshot) {
    return RefreshIndicator(
        onRefresh: handleRefresh,
        child: ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            return _buildItemList(snapshot.data[index]);
          },
        ));
  }

  Widget _buildItemList(Istilah model) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 2.0,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Text(
                  model.namaIstilah,
                  style: GoogleFonts.mcLaren(fontSize: 17, color: Colors.red),
                ),
              ),
              Divider(
                indent: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Text(
                  model.penjelasan,
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchInput() {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                controller: tecSearch,
                cursorColor: Theme.of(context).primaryColor,
                style: TextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                  hintText: "Search..",
                  hintStyle: textLabel,
                  prefixIcon: Material(
                    elevation: 0.0,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: Icon(Icons.search),
                  ),
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 25, vertical: 13),
                ),
                onChanged: (value) {
                  setState(() {
                    _currentSearch = value;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());
}
