import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_instance/get_instance.dart';
import 'package:async/async.dart';

class ShipsPage extends StatefulWidget {
  @override
  _ShipsPageState createState() => _ShipsPageState();
}

class _ShipsPageState extends State<ShipsPage>
    with AutomaticKeepAliveClientMixin {
  final Dio spaceXAPI = Get.find();
  final AsyncMemoizer _memoizer = AsyncMemoizer();

  @override
  void initState() {
    super.initState();
    _fetchShips();
  }

  Future<void> _fetchShips() async {
    return await this._memoizer.runOnce(() async {
      final response = await spaceXAPI.get('/ships');
      if (response.statusCode == 200) {
        final ships = [...response.data];
        return ships;
      } else {
        throw Exception('Failed to return Ships');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder(
      future: _fetchShips(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              var shipData = data[index];
              return ListTile(
                  leading: CachedNetworkImage(
                      imageUrl: shipData['image'] ??
                          'https://i.imgur.com/woCxpkj.jpg'),
                  title: Text(shipData['name']),
                  subtitle: Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: List<Widget>.generate(
                        shipData['roles'].length,
                        (index) => Chip(
                              label: Text(shipData['roles'][index].toString()),
                            )),
                  ));
            },
          );
        } else if (snapshot.hasError) {
          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text('Problem fetching ships data')));
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
