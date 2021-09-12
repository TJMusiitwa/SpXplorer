import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spxplorer/pages/launches/launchDetails.dart';
import 'package:spxplorer/services/spacexAPIState.dart';

class PastLaunches extends ConsumerWidget {
  const PastLaunches({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var upcoming = watch(pastLaunchesFuture);

    return upcoming.when(
      data: (data) => ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          var launch = data[index];

          return ListTile(
              leading: Container(
                height: 150,
                width: 120,
                child: CachedNetworkImage(
                  imageUrl: launch.links!.patch!.large.toString(),
                  placeholder: (context, _) => Image.asset('assets/logo.png'),
                  errorWidget: (context, _, __) =>
                      Image.asset('assets/logo.png'),
                ),
              ),
              title: Text(launch.name),
              subtitle: Text(launch.dateUtc.toString()),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => LaunchDetails(launch: launch),
                      fullscreenDialog: true)));
        },
      ),
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('${error.toString()}')),
    );
  }
}
