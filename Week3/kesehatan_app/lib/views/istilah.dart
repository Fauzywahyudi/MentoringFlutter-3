import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kesehatan_app/api/web_service.dart';

class IstilahPage extends StatefulWidget {
  static const routeName = '/istilah';
  @override
  _IstilahPageState createState() => _IstilahPageState();
}

class _IstilahPageState extends State<IstilahPage> {
  String _keyword = '';
  var _tecSearch = TextEditingController();
  bool _isSearch = false;
  Widget get _action => _isSearch
      ? IconButton(
          icon: Icon(Icons.close),
          onPressed: () => onClickAction(),
        )
      : IconButton(
          icon: Icon(Icons.search),
          onPressed: () => onClickAction(),
        );

  void onClickAction() {
    setState(() {
      _isSearch = !_isSearch;
      _keyword = '';
      _tecSearch.text = '';
    });
  }

  Widget get _title => _isSearch
      ? TextField(
          controller: _tecSearch,
          autofocus: _isSearch,
          style: TextStyle(color: Colors.white),
          decoration:
              InputDecoration(border: InputBorder.none, hintText: 'Search...'),
          onChanged: (v) {
            setState(() {
              _keyword = v;
            });
          },
        )
      : Text('Istilah Kesehatan');

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: _title,
        actions: [_action],
      ),
      body: Container(
          height: size.height,
          width: size.width,
          child: FutureBuilder<List>(
            future: _getIstilah(_keyword),
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

  Future<List> _getIstilah(String keyword) async {
    final result = await http.post(WebService.getIstilah, body: {
      'keyword': keyword,
    });
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
      child: ExpansionTile(
        title: Text(
          list['nama_istilah'],
          style: TextStyle(fontSize: 20),
        ),
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  list['penjelasan'],
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 17),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
