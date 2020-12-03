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

class TransactionTab extends StatefulWidget {
  @override
  _TransactionTabState createState() => _TransactionTabState();
}

class _TransactionTabState extends State<TransactionTab>
    with TickerProviderStateMixin {
  ScrollController _scrollController;
  final itemSize = 100.0;
  final transaksiProv = TransaksiProvider();
  var f = NumberFormat.currency(
    decimalDigits: 0,
    symbol: '',
  );
  int _uang = 0;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    getUang();
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
                        child: FutureBuilder<List<Transaksi>>(
                          future: transaksiProv.getTransaksi('all', ''),
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
          ],
        ),
      ),
    );
  }

  Widget _buildListBuilder(AsyncSnapshot<List<Transaksi>> snapshot) {
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
                    onPressed: () {
                      final snackBar = SnackBar(
                        content: Text('Undo delete action?'),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      );

                      // Find the Scaffold in the widget tree and use
                      // it to show a SnackBar.
                      Scaffold.of(context).showSnackBar(snackBar);
                      setState(() {
                        _uang = _uang - model.jumlahTransaksi;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
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

  void _scrollListener() {}
}
