import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_instance/get_instance.dart';
import 'package:spxplorer/models/nextLaunch_model.dart';
import 'package:spxplorer/pages/launches/launchDetails.dart';

class NextLaunchWidget extends StatefulWidget {
  @override
  _NextLaunchWidgetState createState() => _NextLaunchWidgetState();
}

class _NextLaunchWidgetState extends State<NextLaunchWidget> {
  final Dio spaceXAPI = Get.find();

  Future<NextLaunch> _fetchNextLaunch() async {
    final response = await spaceXAPI.get('/launches/next');
    if (response.statusCode == 200) {
      return NextLaunch.fromJson(response.data);
    } else {
      throw Exception(response.statusMessage);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchNextLaunch();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NextLaunch>(
      future: _fetchNextLaunch(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var nextLaunchData = snapshot.data;
          return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => LaunchDetails(
                    id: nextLaunchData.id,
                    launchName: nextLaunchData.name,
                  ),
                )),
            child: Card(
              child: ListTile(
                leading: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Flight'),
                      Text(nextLaunchData.flightNumber.toString())
                    ],
                  ),
                ),
                title: Text(nextLaunchData.name),
                subtitle: Text(nextLaunchData.dateLocal.toLocal().toString()),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
