import 'package:flutter/material.dart';
import 'package:spxplorer/pages/launches/latestLaunches.dart';
import 'package:spxplorer/pages/launches/pastLaunches.dart';
import 'package:spxplorer/pages/launches/upcomingLaunches.dart';

class LaunchesPage extends StatefulWidget {
  @override
  _LaunchesPageState createState() => _LaunchesPageState();
}

class _LaunchesPageState extends State<LaunchesPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Launches',
          ),
          elevation: 0,
          bottom: TabBar(tabs: [
            Tab(
              text: 'Latest',
            ),
            Tab(
              text: 'Upcoming',
            ),
            Tab(
              text: 'Past',
            )
          ]),
        ),
        body: TabBarView(
          children: [LatestLaunches(), UpcomingLaunches(), PastLaunches()],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
