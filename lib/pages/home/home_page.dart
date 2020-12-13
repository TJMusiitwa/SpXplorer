import 'package:flutter/material.dart';
import 'package:spxplorer/pages/home/next_launch.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SpXplorer'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Upcoming Launch',
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(
              height: 10,
            ),
            NextLaunchWidget(),
            Container(
              color: Theme.of(context).accentColor,
            )
          ],
        ),
      ),
    );
  }
}
