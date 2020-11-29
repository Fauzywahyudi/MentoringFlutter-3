import 'package:finance_app/src/pages/tabs/home_tab.dart';
import 'package:finance_app/src/pages/tabs/info_tabs.dart';
import 'package:finance_app/src/pages/tabs/profil_tab.dart';
import 'package:finance_app/src/pages/tabs/transaction_tab.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = [];

  @override
  void initState() {
    _widgetOptions.add(HomeTab());
    _widgetOptions.add(TransactionTab());
    _widgetOptions.add(InfoTab());
    _widgetOptions.add(ProfilTab());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Container _buildBottomNavBar() {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
      ]),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              duration: Duration(milliseconds: 800),
              tabBackgroundColor: Colors.grey[800],
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                  backgroundColor: Colors.green,
                ),
                GButton(
                  icon: LineIcons.money,
                  text: 'Transaction',
                  backgroundColor: Colors.green,
                ),
                GButton(
                  icon: LineIcons.info,
                  text: 'Info',
                  backgroundColor: Colors.green,
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                  backgroundColor: Colors.green,
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              }),
        ),
      ),
    );
  }
}
