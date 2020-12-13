import 'package:flutter/material.dart';

class LaunchDetails extends StatefulWidget {
  final String id, launchName;

  const LaunchDetails({Key key, this.id, this.launchName}) : super(key: key);
  @override
  _LaunchDetailsState createState() => _LaunchDetailsState();
}

class _LaunchDetailsState extends State<LaunchDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.launchName),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [Text(widget.id)],
        ),
      ),
    );
  }
}
