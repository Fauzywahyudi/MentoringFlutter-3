import 'package:go_healthy/src/pages/tabs/home_tab.dart';
import 'package:go_healthy/src/pages/tabs/info_tabs.dart';
import 'package:go_healthy/src/pages/tabs/profil_tab.dart';
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
      color: Colors.grey[100],
      padding: EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              gap: 8,
              activeColor: Colors.red,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              duration: Duration(milliseconds: 500),
              tabBackgroundColor: Colors.grey[800],
              color: Colors.white,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                  backgroundColor: Colors.white,
                ),
                GButton(
                  icon: LineIcons.info,
                  text: 'Info',
                  backgroundColor: Colors.white,
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                  backgroundColor: Colors.white,
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
