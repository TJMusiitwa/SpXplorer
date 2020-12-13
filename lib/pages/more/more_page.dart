import 'dart:io';

import 'package:flutter/material.dart';
import 'package:spxplorer/pages/more/company.dart';
import 'package:spxplorer/pages/more/roadster.dart';

class MorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('More'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.business),
              title: Text('About SpaceX'),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => CompanyPage())),
            ),
            ListTile(
              leading: Icon(Icons.directions_car),
              title: Text('Roadster In Space'),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => RoadsterPage())),
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Tell all your space nerds about SpXplorer'),
              onTap: () => Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text('Share links will be added soon'))),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Platform.isIOS
                  ? Text('Rate us on the App Store')
                  : Text('Rate us on the Google Play Store'),
              onTap: () => Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text('Links will be added soon'))),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Open Source Licenses'),
              onTap: () => showLicensePage(context: context),
            ),
          ],
        ),
      ),
    );
  }
}
