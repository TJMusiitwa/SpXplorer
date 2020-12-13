import 'package:flutter/material.dart';
import 'package:spxplorer/pages/home/home_page.dart';
import 'package:spxplorer/pages/launches/launches.dart';
import 'package:spxplorer/pages/more/more_page.dart';
import 'package:spxplorer/pages/vehicles/vehicles.dart';

class SpxplorerNav extends StatefulWidget {
  @override
  _SpxplorerNavState createState() => _SpxplorerNavState();
}

class _SpxplorerNavState extends State<SpxplorerNav> {
  int _currentPage = 0;
  final _pages = [HomePage(), LaunchesPage(), VehiclesPage(), MorePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_currentPage),
      //drawer: Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'SpXplorer'),
          BottomNavigationBarItem(
              icon: Icon(Icons.arrow_upward), label: 'Launches'),
          BottomNavigationBarItem(icon: Icon(Icons.commute), label: 'Vehicles'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More')
        ],
        currentIndex: _currentPage,
        onTap: (value) => setState(() {
          _currentPage = value;
        }),
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Theme.of(context).unselectedWidgetColor,
      ),
    );
  }
}
