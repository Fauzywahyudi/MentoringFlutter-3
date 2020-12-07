import 'dart:async';

import 'package:go_healthy/src/config/api.dart';
import 'package:go_healthy/src/model/informasi.dart';
import 'package:go_healthy/src/model/tips.dart';
import 'package:go_healthy/src/provider/informasi_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_healthy/src/theme/decoration.dart';
import 'package:go_healthy/src/widget/text.dart';

class DetailInformasi extends StatefulWidget {
  final Tips model;

  const DetailInformasi({@required this.model});
  @override
  _DetailInformasiState createState() => _DetailInformasiState();
}

class _DetailInformasiState extends State<DetailInformasi> {
  final infoProvider = InformasiProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.model.judulTips),
      ),
      body: Container(
        child: _body(),
      ),
    );
  }

  Widget _body() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: FutureBuilder<List<Informasi>>(
        future: infoProvider.getInformasi(widget.model.idTips),
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
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              model.judulInformasi,
              style: textMenu,
              textAlign: TextAlign.justify,
            ),
          ),
          _buildImage(model.image),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              model.isi,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(String image) {
    if (image == null || image == '') return Container();
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: Image.network(
        Api.imgTips + image,
        fit: BoxFit.cover,
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
