import 'package:async/async.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_instance/get_instance.dart';

class UpcomingLaunches extends StatefulWidget {
  @override
  _UpcomingLaunchesState createState() => _UpcomingLaunchesState();
}

class _UpcomingLaunchesState extends State<UpcomingLaunches>
    with AutomaticKeepAliveClientMixin {
  final Dio spaceXAPI = Get.find();

  final AsyncMemoizer _memoizer = AsyncMemoizer();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: FutureBuilder(
        future: _fetchUpcomingLaunches(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var upcoming = snapshot.data;
            return ListView.builder(
              itemCount: upcoming.length,
              itemBuilder: (BuildContext context, int index) {
                var data = upcoming[index];
                return ListTile(
                  title: Text(data['name']),
                  subtitle: Text(
                      DateTime.parse(data["date_local"]).toLocal().toString()),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _fetchUpcomingLaunches();
  }

  Future<void> _fetchUpcomingLaunches() async {
    return await this._memoizer.runOnce(() async {
      final response = await spaceXAPI.get('/launches/upcoming',
          options: RequestOptions(responseType: ResponseType.json));

      if (response.statusCode == 200) {
        final upcomingLaunch = List.from(response.data);
        return upcomingLaunch;
      } else {
        throw Exception('Failed to load upcoming launches');
      }
    });
  }

  @override
  bool get wantKeepAlive => true;
}
