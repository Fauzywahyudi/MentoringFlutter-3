import 'dart:async';
import 'package:finance_app/src/model/transaksi.dart';
import 'package:finance_app/src/provider/shared_preference.dart';
import 'package:finance_app/src/provider/transaksi_provider.dart';
import 'package:finance_app/src/theme/decoration.dart';
import 'package:finance_app/src/widget/background.dart';
import 'package:finance_app/src/widget/dialog.dart';
import 'package:finance_app/src/widget/text.dart';
import 'package:finance_app/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class TransactionTab extends StatefulWidget {
  @override
  _TransactionTabState createState() => _TransactionTabState();
}

class _TransactionTabState extends State<TransactionTab>
    with TickerProviderStateMixin {
  final itemSize = 100.0;
  final transaksiProv = TransaksiProvider();
  var f = NumberFormat.currency(
    decimalDigits: 0,
    symbol: '',
  );
  int _uang = 0;
  String _tipe = 'all';
  String _value = '';
  DateTime selectedDate;

  @override
  void initState() {
    getUang();
    selectedDate = DateTime.now();
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
              title: 'Finance',
            ),
            Container(
              margin: EdgeInsets.only(top: 100),
              width: size.width,
              height: size.height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    InfoCash(
                      size: size,
                      uang: f.format(_uang),
                      onPressed: () => onAddTransaksi(),
                    ),
                    SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      width: size.width,
                      height: size.height - (230 + kToolbarHeight * 2),
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
                                    _tipe.toUpperCase(),
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
            style: DefaultTextStyle.of(context)
                .style
                .copyWith(fontWeight: FontWeight.bold),
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
                title: Text('Today'),
                onTap: () => onTapDialog('today'),
              ),
              ListTile(
                title: Text('Month'),
                onTap: () => onTapDialog('month'),
              ),
            ],
          ),
        ),
      ),
    );
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

  void onTapDialog(String tipe) async {
    switch (tipe) {
      case 'all':
        setState(() {
          _tipe = tipe;
          _value = '';
        });
        Navigator.pop(context);
        break;
      case 'month':
        getMonthYear();
        break;
      case 'today':
        DateTime dateNow = DateTime.now();
        setState(() {
          _tipe = tipe;
          _value = '${dateNow.year}-${dateNow.month}-${dateNow.day}';
        });
        print(dateNow.toIso8601String());
        Navigator.pop(context);
        break;
      default:
        print(tipe);
        break;
    }
  }

  void getMonthYear() async {
    Navigator.pop(context);
    showMonthPicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 1, 5),
      lastDate: DateTime(DateTime.now().year + 1, 9),
      initialDate: selectedDate ?? DateTime.now(),
      locale: Locale("en"),
    ).then((date) {
      if (date != null) {
        setState(() {
          selectedDate = date;
          _tipe = 'month';
          _value =
              '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}';
        });
        print(selectedDate.toIso8601String());
      }
    });
  }

  Future onAddTransaksi() async {
    await showDialog(
        context: context,
        builder: (context) => DialogAddTransaksi(
              uang: _uang,
            ));
    handleRefresh();
  }

  Future getUang() async {
    DataShared dataShared = DataShared();
    setUang(await dataShared.getUang());
  }

  void setUang(int value) => setState(() => _uang = value);

  Future<Null> handleRefresh() async {
    Completer<Null> completer = new Completer<Null>();
    new Future.delayed(new Duration(milliseconds: 500)).then((_) {
      completer.complete();
      setState(() {});
      getUang();
    });
    return completer.future;
  }
}
