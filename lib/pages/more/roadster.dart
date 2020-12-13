import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:get_instance/get_instance.dart';
import 'package:spxplorer/models/roadster_model.dart';
import 'package:intl/intl.dart';

class RoadsterPage extends StatefulWidget {
  @override
  _RoadsterPageState createState() => _RoadsterPageState();
}

class _RoadsterPageState extends State<RoadsterPage> {
  var launchDtFmt = DateFormat('d MMMM y').add_jm();
  var distanceFmt = NumberFormat.decimalPattern();
  final Dio spaceXAPI = Get.find();

  Future<Roadster> _fetchRoadster() async {
    final response = await spaceXAPI.get('/roadster');
    if (response.statusCode == 200) {
      return Roadster.fromJson(response.data);
    } else {
      throw Exception('Failed to load roadster');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchRoadster();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Roadster>(
        future: _fetchRoadster(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var roadsterData = snapshot.data;
            return CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  expandedHeight: 180,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(roadsterData.name),
                    background: CachedNetworkImage(
                      imageUrl: roadsterData.flickrImages[0],
                      fit: BoxFit.cover,
                    ),
                  ),
                  actions: [
                    IconButton(
                        icon: Icon(Icons.link),
                        onPressed: () {
                          print(roadsterData.wikipedia);
                        })
                  ],
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          roadsterData.details,
                          textAlign: TextAlign.justify,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(fontSize: 18),
                        ),
                        // Text(
                        //   'Stats',
                        //   style: Theme.of(context).textTheme.headline5,
                        // ),
                        ListTile(
                          title: Text('Days in orbit'),
                          subtitle: Text(
                            roadsterData.periodDays.toStringAsFixed(0),
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        Card(
                          child: ListTile(
                              title: Text('Launch Date'),
                              subtitle: Text(
                                launchDtFmt.format(roadsterData.launchDateUtc),
                                style: Theme.of(context).textTheme.headline6,
                              )),
                        ),
                        Card(
                          child: ListTile(
                            title: Text('Earth Distance(Km)'),
                            subtitle: Text(
                              distanceFmt.format(roadsterData.earthDistanceKm),
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: Text('Mars Distance(Km)'),
                            subtitle: Text(
                              distanceFmt.format(roadsterData.marsDistanceKm),
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
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
}
