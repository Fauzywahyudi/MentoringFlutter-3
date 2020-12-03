import 'dart:async';

import 'package:finance_app/src/config/api.dart';
import 'package:finance_app/src/config/router.gr.dart';
import 'package:finance_app/src/model/informasi.dart';
import 'package:finance_app/src/provider/informasi_provider.dart';
import 'package:finance_app/src/theme/decoration.dart';
import 'package:finance_app/src/widget/background.dart';
import 'package:finance_app/src/widget/text.dart';
import 'package:flutter/material.dart';

class InfoTab extends StatefulWidget {
  @override
  _InfoTabState createState() => _InfoTabState();
}

class _InfoTabState extends State<InfoTab> with TickerProviderStateMixin {
  final informProv = InformasiProvider();

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
          title: 'Info And Tips',
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
                  width: size.width,
                  height: size.height - (70 + kToolbarHeight * 2),
                  child: Card(
                    child: FutureBuilder<List<Informasi>>(
                      future: informProv.getInformasi(),
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
                ),
              ],
            ),
          ),
        ),
      ]),
    ));
  }

  Widget _buildListBuilder(AsyncSnapshot<List<Informasi>> snapshot) {
    return RefreshIndicator(
      onRefresh: handleRefresh,
      child: ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          return _itemListTransaksi(snapshot.data[index]);
        },
      ),
    );
  }

  Widget _itemListTransaksi(Informasi model) {
    return InkWell(
      onTap: () =>
          Router.navigator.pushNamed(Router.detailInformasi, arguments: model),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 40,
              color: Colors.green,
              height: 100,
              margin: EdgeInsets.all(10),
              child: Hero(
                tag: model.idInformasi.toString(),
                child: Image.network(
                  Api.images + model.image,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                model.judul,
                textAlign: TextAlign.justify,
                style: textMenu,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<Null> handleRefresh() async {
    Completer<Null> completer = new Completer<Null>();
    new Future.delayed(new Duration(milliseconds: 500)).then((_) {
      completer.complete();
      setState(() {});
    });
    return completer.future;
  }
}
