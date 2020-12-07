import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_healthy/src/config/api.dart';
import 'package:http/http.dart' as http;
// import 'package:go_healthy/src/pages/istilah/detail_berita.dart';

class BeritaPage extends StatefulWidget {
  static const routeName = '/berita';
  @override
  _BeritaPageState createState() => _BeritaPageState();
}

class _BeritaPageState extends State<BeritaPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Berita'),
      ),
      body: Container(
          height: size.height,
          width: size.width,
          child: FutureBuilder<List>(
            future: _getBerita(),
            builder: (context, snapshot) {
              var state = snapshot.connectionState;
              if (state != ConnectionState.done) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                return RefreshIndicator(
                  onRefresh: handleRefresh,
                  child: snapshot.data.isEmpty
                      ? _noData()
                      : ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return _buildItem(context, snapshot.data[index]);
                          },
                        ),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else {
                return Text('');
              }
            },
          )),
    );
  }

  Future<List> _getBerita() async {
    final result = await http.get(Api.getBerita);
    if (result.statusCode == 200) {
      final response = jsonDecode(result.body);
      final data = response['data'];
      return data;
    } else {
      return [];
    }
  }

  Future<Null> handleRefresh() async {
    Completer<Null> completer = new Completer<Null>();
    new Future.delayed(new Duration(milliseconds: 500)).then((_) {
      completer.complete();
      setState(() {});
    });
    return completer.future;
  }

  Widget _noData() {
    return Center(
      child: Text('Data tidak ditemukan'),
    );
  }

  Widget _buildItem(BuildContext context, var list) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Hero(
              tag: list['id_berita'].toString(),
              child:
                  Image.network(Api.images + list['image'], fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              list['judul'],
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('by ' + list['penulis']),
                FlatButton(
                    onPressed: () {},
                    // onPressed: () => Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => DetailBerita(
                    //               data: list,
                    //             ))),
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
