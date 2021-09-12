import 'package:flutter/material.dart';
import 'package:spxplorer/pages/vehicles/landpads.dart';
import 'package:spxplorer/pages/vehicles/rockets_page.dart';
import 'package:spxplorer/pages/vehicles/ships_page.dart';

class VehiclesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Vehicles',
          ),
          elevation: 0,
          bottom: TabBar(tabs: [
            Tab(
              text: 'Rockets',
            ),
            Tab(
              text: 'Landers',
            ),
            Tab(
              text: 'Ships',
            )
          ]),
        ),
        body: TabBarView(children: [RocketsPage(), LandpadsTab(), ShipsPage()]),
      ),
    );
  }
}
