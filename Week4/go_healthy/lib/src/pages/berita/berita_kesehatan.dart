import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_healthy/src/config/api.dart';
import 'package:go_healthy/src/config/router.gr.dart';
import 'package:go_healthy/src/model/berita.dart';
import 'package:go_healthy/src/provider/berita_provider.dart';
import 'package:go_healthy/src/widget/background.dart';
import 'package:go_healthy/src/widget/button.dart';
import 'package:go_healthy/src/widget/text.dart';

class BeritaKesehatan extends StatefulWidget {
  @override
  _BeritaKesehatanState createState() => _BeritaKesehatanState();
}

class _BeritaKesehatanState extends State<BeritaKesehatan> {
  final asset = "assets/images/";
  var tecSearch = TextEditingController();
  final beritaProv = BeritaProvider();

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
                title: 'Berita Kesehatan',
                height: 150,
              ),
              BackIconButton(
                onPressed: () => Navigator.pop(context),
              ),
              Container(
                margin: EdgeInsets.only(top: 150),
                width: size.width,
                height: MediaQuery.of(context).size.height - 150,
                child: FutureBuilder<List<Berita>>(
                  future: beritaProv.getBerita(),
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListBuilder(AsyncSnapshot<List<Berita>> snapshot) {
    return RefreshIndicator(
      onRefresh: handleRefresh,
      child: ListView.builder(
        padding: EdgeInsets.only(top: 0),
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          return _buildItemList(snapshot.data[index]);
        },
      ),
    );
  }

  Widget _buildItemList(Berita model) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Hero(
              tag: model.idBerita.toString(),
              child: Image.network(Api.images + model.image, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              model.judul,
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('by ' + model.penulis),
                FlatButton(
                    onPressed: () => Router.navigator
                        .pushNamed(Router.detailBerita, arguments: model),
                    child: Text(
                      'Selengkapnya',
                      style: TextStyle(color: Colors.blue),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
