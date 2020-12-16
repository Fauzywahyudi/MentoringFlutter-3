import 'dart:async';
import 'package:go_healthy/src/config/api.dart';
import 'package:go_healthy/src/config/router.gr.dart';
import 'package:go_healthy/src/model/tips.dart';
import 'package:go_healthy/src/provider/informasi_provider.dart';
import 'package:go_healthy/src/theme/decoration.dart';
import 'package:go_healthy/src/widget/background.dart';
import 'package:go_healthy/src/widget/text.dart';
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
            title: 'Info And Tips Sehat',
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
                      child: FutureBuilder<List<Tips>>(
                        future: informProv.getTips(),
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
                            return Center(
                                child: Text(snapshot.error.toString()));
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
      ),
    );
  }

  Widget _buildListBuilder(AsyncSnapshot<List<Tips>> snapshot) {
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

  Widget _itemListTransaksi(Tips model) {
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
              height: 150,
              margin: EdgeInsets.all(10),
              child: Image.network(
                Api.imgTips + model.image,
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                model.judulTips,
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
