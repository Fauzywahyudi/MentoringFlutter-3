import 'dart:async';

import 'package:finance_app/src/model/transaksi.dart';
import 'package:finance_app/src/provider/shared_preference.dart';
import 'package:finance_app/src/provider/transaksi_provider.dart';
import 'package:finance_app/src/theme/decoration.dart';
import 'package:finance_app/src/validation/transaksi_validation.dart';
import 'package:finance_app/src/widget/background.dart';
import 'package:finance_app/src/widget/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';

class TransactionTab extends StatefulWidget {
  @override
  _TransactionTabState createState() => _TransactionTabState();
}

class _TransactionTabState extends State<TransactionTab>
    with TickerProviderStateMixin {
  ScrollController _scrollController;
  final itemSize = 100.0;
  final transaksiProv = TransaksiProvider();
  TabController _tabController;
  var f = NumberFormat.currency(
    decimalDigits: 0,
    symbol: '',
  );
  int _uang = 0;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_listener);
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    getUang();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.grey[100],
        child: Stack(
          children: [
            BackGround(),
            Container(
              margin: EdgeInsets.only(top: 30),
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
                                  : RefreshIndicator(
                                      onRefresh: handleRefresh,
                                      child: ListView.builder(
                                        itemCount: snapshot.data.length,
                                        itemBuilder: (context, index) {
                                          return _itemListTransaksi(
                                              snapshot.data[index]);
                                        },
                                      ),
                                    );
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

  Widget _itemListTransaksi(Transaksi model) {
    DateTime date = model.createAt;
    return Card(
      child: ExpansionTile(
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

  AppBar _buildAppBar() {
    return AppBar(
      leading: Icon(LineIcons.money),
      title: Text('Finance'),
      elevation: 0,
    );
  }

  Future<Null> handleRefresh() async {
    Completer<Null> completer = new Completer<Null>();
    new Future.delayed(new Duration(milliseconds: 500)).then((_) {
      completer.complete();
      setState(() {});
      getUang();
    });
    return completer.future;
  }

  _listener() {
    print("change");
    if (_tabController.index == 0) {
      // setState(() {
      //   _index = 0;
      // });
    }
    if (_tabController.index == 1) {
      // setState(() {
      //   _index = 1;
      // });
    }
  }

  void _scrollListener() {
    setState(() {
      var index = (_scrollController.offset / itemSize).round() + 1;
    });
  }
}

class DialogAddTransaksi extends StatefulWidget {
  final int uang;

  const DialogAddTransaksi({@required this.uang});
  @override
  _DialogAddTransaksiState createState() => _DialogAddTransaksiState();
}

class _DialogAddTransaksiState extends State<DialogAddTransaksi>
    with TransaksiValidation {
  final formKey = GlobalKey<FormState>();
  String _valRadio = 'in';
  Color _color = Colors.green;
  var _tecJumlah = MoneyMaskedTextController(
      thousandSeparator: ',', decimalSeparator: '.', initialValue: 0);
  var _tecDeskripsi = TextEditingController();
  String _jumlah;
  String _deskripsi;

  void _onChangeRadio(String value) => setState(() {
        _valRadio = value;
        _color = value == 'in' ? Colors.green : Colors.red;
        onChangeJumlah(_tecJumlah.text);
      });

  String _errorJumlah = null;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: _color,
      contentPadding: EdgeInsets.symmetric(horizontal: 30),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      content: Container(
        height: MediaQuery.of(context).size.height * 0.40,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: 20),
                TextFormField(
                  controller: _tecJumlah,
                  keyboardType: TextInputType.number,
                  decoration: inputDecoration('Jumlah')
                      .copyWith(errorText: _errorJumlah),
                  onChanged: onChangeJumlah,
                  validator: validateJumlah,
                  onSaved: (value) {
                    _jumlah = value;
                  },
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Jenis', style: textLabel),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Text('In'),
                              Radio(
                                  value: 'in',
                                  groupValue: _valRadio,
                                  onChanged: _onChangeRadio),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Out'),
                              Radio(
                                  activeColor: Colors.red,
                                  value: 'out',
                                  groupValue: _valRadio,
                                  onChanged: _onChangeRadio),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _tecDeskripsi,
                  decoration: inputDecoration('Deskripsi'),
                  validator: validateDeskripsi,
                  onSaved: (value) {
                    _deskripsi = value;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      title: Text("Add Transaction", style: textWhite),
      actions: <Widget>[
        RaisedButton(
            child: Text(
              "Konfirmasi",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            onPressed: onPressed),
        SizedBox(width: 10),
      ],
    );
  }

  void onChangeJumlah(String value) {
    var separator = value.split('.');
    String newValue = separator.first.replaceAll(',', '');
    if (double.parse(newValue) > double.parse(widget.uang.toString()) &&
        _valRadio == 'out') {
      setState(() {
        _errorJumlah = 'Saldo tidak cukup';
      });
    } else {
      setState(() {
        _errorJumlah = null;
      });
    }
  }

  void onPressed() async {
    if (formKey.currentState.validate() &&
        _valRadio != null &&
        _errorJumlah == null) {
      formKey.currentState.save();
      TransaksiProvider provider = TransaksiProvider();
      var separator = _jumlah.split('.');
      String newValue = separator.first.replaceAll(',', '');
      final response = await provider.addTransaksi(Transaksi(
          jumlahTransaksi: int.parse(newValue),
          jenisTransaksi: _valRadio,
          deskripsi: _deskripsi));
      if (response != null) {
        DataShared dataShared = DataShared();
        await dataShared.setUserPref(response);
        Navigator.pop(context);
      }
    }
  }
}

class InfoCash extends StatelessWidget {
  const InfoCash({
    @required this.size,
    @required this.onPressed,
    this.uang,
  });

  final Size size;
  final VoidCallback onPressed;
  final String uang;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: size.width,
      height: 150,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Cash', style: textTitle),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(uang, style: textValue),
                    ],
                  )
                ],
              ),
              FloatingActionButton(
                onPressed: onPressed,
                child: Icon(Icons.add),
                mini: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
