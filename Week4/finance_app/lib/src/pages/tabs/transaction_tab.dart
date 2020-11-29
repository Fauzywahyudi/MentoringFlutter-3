import 'package:flutter/material.dart';

class TransactionTab extends StatefulWidget {
  @override
  _TransactionTabState createState() => _TransactionTabState();
}

class _TransactionTabState extends State<TransactionTab>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_listener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              floating: true,
              snap: true,
              elevation: 0,
              centerTitle: true,
              title: Text('Transaction'),
              expandedHeight: 200,
              bottom: TabBar(
                controller: _tabController,
                tabs: <Widget>[
                  Tab(
                    text: "Income",
                  ),
                  Tab(
                    text: "Spending",
                  ),
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
}
