import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController _tabController;
  List<String> _listKategori = ['Anime', 'Car', 'Game', 'Nature', 'Town'];
  List<String> _listAnime = ['eren', 'levi', 'naruto', 'onepiece', 'senku'];
  List<String> _listCar = ['car1', 'car2', 'car3', 'car4', 'car5'];
  List<String> _listGame = ['alpha', 'amongus', 'ml', 'pubg1', 'pubg2'];
  List<String> _listNature = [
    'nature1',
    'nature2',
    'nature3',
    'nature4',
    'nature5'
  ];
  List<String> _listTown = ['town1', 'town2', 'town3', 'town4', 'town5'];

  static const _url = 'assets/images/';
  static const _format = '.jpg';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: Text('Wallpaper App'),
              pinned: true,
              floating: true,
              snap: true,
              elevation: 2,
              forceElevated: innerBoxIsScrolled,
              bottom: TabBar(
                isScrollable: true,
                controller: _tabController,
                indicatorWeight: 2,
                tabs: <Widget>[
                  for (var kategori in _listKategori)
                    Tab(
                      text: kategori,
                    )
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            _fragmentTab(_listKategori[0], _listAnime),
            _fragmentTab(_listKategori[1], _listCar),
            _fragmentTab(_listKategori[2], _listGame),
            _fragmentTab(_listKategori[3], _listNature),
            _fragmentTab(_listKategori[4], _listTown),
          ],
        ),
      ),
    );
  }

  Widget _fragmentTab(String kategori, List<String> list) {
    return Container(
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              height: 250,
              child: Image.asset(
                _url +
                    kategori.toLowerCase() +
                    '/' +
                    list[index].toLowerCase() +
                    _format,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
