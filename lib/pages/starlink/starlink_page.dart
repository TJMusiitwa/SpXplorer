import 'package:flutter/material.dart';
import 'package:spxplorer/pages/starlink/list_tab.dart';
import 'package:spxplorer/pages/starlink/map_tab.dart';

class StarlinkPage extends StatefulWidget {
  const StarlinkPage({Key? key}) : super(key: key);

  @override
  _StarlinkPageState createState() => _StarlinkPageState();
}

class _StarlinkPageState extends State<StarlinkPage>
    with AutomaticKeepAliveClientMixin<StarlinkPage> {
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Starlink'),
          bottom: TabBar(tabs: [
            Tab(
              icon: Icon(Icons.list),
              text: 'List',
            ),
            Tab(
              icon: Icon(Icons.language),
              text: 'Map',
            ),
          ]),
        ),
        body: TabBarView(children: [ListTab(), MapTab()]),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
