import 'dart:async';

import 'package:finance_app/src/model/transaksi.dart';
import 'package:finance_app/src/provider/transaksi_provider.dart';
import 'package:finance_app/src/theme/decoration.dart';
import 'package:finance_app/src/widget/background.dart';
import 'package:finance_app/src/widget/text.dart';
import 'package:flutter/material.dart';
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
  var f = NumberFormat.currency(decimalDigits: 2, symbol: '');

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_listener);
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);

    // print(f.format(1200000.345));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _buildAppBar(),
      // floatingActionButton: _buildFab(),
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
              child: Column(
                children: [
                  InfoCash(size: size),
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
                                ? NoData()
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
          ],
        ),
      ),
    );
  }

  ListView oldList() {
    return ListView(
      controller: _scrollController,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(bottom: 50),
      children: [
        _itemListTransaksi(
            Transaksi(jenisTransaksi: 'in', jumlahTransaksi: 200000)),
        _itemListTransaksi(
            Transaksi(jenisTransaksi: 'in', jumlahTransaksi: 300000)),
        _itemListTransaksi(
            Transaksi(jenisTransaksi: 'out', jumlahTransaksi: 100000)),
        _itemListTransaksi(
            Transaksi(jenisTransaksi: 'in', jumlahTransaksi: 150000)),
        _itemListTransaksi(
            Transaksi(jenisTransaksi: 'out', jumlahTransaksi: 100000)),
      ],
    );
  }

  Widget _itemListTransaksi(Transaksi model) {
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
            Text('2 Des 2020'),
          ],
        ),
      ),
    );
  }

  // Widget _itemSpend() {
  //   return ExpansionTile(
  //     leading: Container(
  //       decoration: BoxDecoration(
  //         color: Colors.red,
  //         shape: BoxShape.circle,
  //       ),
  //       child: Icon(
  //         Icons.keyboard_arrow_up,
  //         color: Colors.white,
  //       ),
  //     ),
  //     title: Text('Rp. 200.000'),
  //   );
  // }

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
    });
    return completer.future;
  }

  Scaffold oldWidget() {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              floating: true,
              snap: true,
              elevation: 0,
              centerTitle: true,
              title: Text('Finance'),
              expandedHeight: 200,
              bottom: TabBar(
                controller: _tabController,
                tabs: <Widget>[
                  Tab(text: "Income"),
                  Tab(text: "Spending"),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Container(),
            Container(),
          ],
        ),
      ),
    );
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

class InfoCash extends StatelessWidget {
  const InfoCash({
    @required this.size,
  });

  final Size size;

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
                      // Expanded(child: Container()),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text('Rp.', style: textValue),
                      // SizedBox(width: 20),
                      Text('1.000.000', style: textValue),
                    ],
                  )
                ],
              ),
              FloatingActionButton(
                onPressed: () {},
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
