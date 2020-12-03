import 'dart:async';
import 'package:finance_app/src/model/transaksi.dart';
import 'package:finance_app/src/provider/transaksi_provider.dart';
import 'package:finance_app/src/theme/decoration.dart';
import 'package:finance_app/src/widget/background.dart';
import 'package:finance_app/src/widget/text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:date_time_picker/date_time_picker.dart';

class DetailTransaksi extends StatefulWidget {
  final String tipe;
  final String value;

  const DetailTransaksi({@required this.tipe, @required this.value});

  @override
  _DetailTransaksiState createState() => _DetailTransaksiState();
}

class _DetailTransaksiState extends State<DetailTransaksi> {
  final transaksiProv = TransaksiProvider();
  var f = NumberFormat.currency(
    decimalDigits: 0,
    symbol: '',
  );

  String _tipe;
  String _value;

  @override
  void initState() {
    _tipe = widget.tipe;
    _value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.grey[100],
        child: Stack(
          children: [
            BackGround(
              title: 'History',
            ),
            Container(
              margin: EdgeInsets.only(top: 100),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      width: size.width,
                      height: size.height - 120,
                      child: Card(
                        child: Stack(
                          children: [
                            FutureBuilder<List<Transaksi>>(
                              future: transaksiProv.getTransaksi(_tipe, _value),
                              builder: (context, snapshot) {
                                var state = snapshot.connectionState;
                                if (state != ConnectionState.done) {
                                  return Center(
                                      child: CircularProgressIndicator());
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
                            Container(
                              color: Colors.green,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.tipe.toUpperCase(),
                                    style: textWhite,
                                  ),
                                  IconButton(
                                    splashColor: Colors.green,
                                    color: Colors.white,
                                    tooltip: 'Sort',
                                    onPressed: () => onTapSorting(),
                                    icon: Icon(Icons.sort),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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

  Widget _buildListBuilder(AsyncSnapshot<List<Transaksi>> snapshot) {
    return RefreshIndicator(
      onRefresh: handleRefresh,
      child: ListView.builder(
        padding: EdgeInsets.only(top: 60),
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          return _itemListTransaksi(snapshot.data[index]);
        },
      ),
    );
  }

  Widget _itemListTransaksi(Transaksi model) {
    DateTime date = model.createAt;
    return Card(
      child: ExpansionTile(
        key: ValueKey(model.idTransaksi),
        leading: Container(
          decoration: BoxDecoration(
            color: model.jenisTransaksi == 'in' ? Colors.green : Colors.red,
            shape: BoxShape.circle,
          ),
          child: Icon(
            model.jenisTransaksi == 'in'
                ? Icons.keyboard_arrow_down
                : Icons.keyboard_arrow_up,
            color: Colors.white,
          ),
        ),
        title: RichText(
          text: TextSpan(
            text: 'Rp. ',
            style: TextStyle(fontWeight: FontWeight.bold),
            children: <TextSpan>[
              TextSpan(
                  text: f.format(model.jumlahTransaksi),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: model.jenisTransaksi == 'in'
                        ? Colors.green
                        : Colors.red,
                  )),
            ],
          ),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
                '${date.hour}:${date.minute < 10 ? '0${date.minute}' : date.minute} ${date.day}-${date.month}-${date.year}')
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Deskripsi',
                          style: textLabel,
                        ),
                      ],
                    ),
                    Divider(),
                    Text(
                      model.deskripsi,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Container(
                  decoration:
                      BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                  child: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    onPressed: () => onDeleteTransaksi(model),
                  ),
                ),
              ],
            ),
          ),
        ],
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

  Future onTapSorting() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Sort By'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: Text('All'),
                onTap: () => onTapDialog('all'),
              ),
              ListTile(
                title: Text('Bulan'),
                onTap: () => onTapDialog('bulan'),
              ),
              ListTile(
                title: Text('Tahun'),
                onTap: () => onTapDialog('tahun'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTapDialog(String tipe) async {
    switch (tipe) {
      case 'all':
        setState(() {
          _tipe = tipe;
          _value = '';
        });
        break;
      case 'bulan':
        getMonth();
        break;
      case 'tahun':
        print(tipe);
        break;
      default:
        print(tipe);
        break;
    }
  }

  Future onDeleteTransaksi(Transaksi model) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Konfirmasi'),
        content: Text('Anda yakin hapus data?'),
        actions: [
          FlatButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Tidak'),
          ),
          FlatButton(
            onPressed: () async {
              await transaksiProv.deleteTransaksi(model);
              Navigator.pop(context);
              handleRefresh();
            },
            child: Text('Iya'),
          ),
        ],
      ),
    );
  }

  void getMonth() {
    DateTimePicker(
      initialValue: '',
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      dateLabelText: 'Date',
      onChanged: (val) => print(val),
      validator: (val) {
        print(val);
        return null;
      },
      onSaved: (val) => print(val),
    );
  }
}
