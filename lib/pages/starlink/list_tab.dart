import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spxplorer/services/spacexAPIState.dart';

class ListTab extends ConsumerWidget {
  const ListTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var starlinks = watch(allStarlinksQuery);
    return starlinks.when(
      data: (starlink) => ListView.builder(
        itemCount: starlink.length,
        itemBuilder: (BuildContext context, int index) {
          var data = starlink[index];
          return ListTile(
            title: Text(data.spaceTrack.objectName.toString()),
            subtitle: Text('LAUNCH DATE: ' +
                data.spaceTrack.launchDate!.toLocal().toString().split(' ')[0]),
          );
        },
      ),
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('${error.toString()}')),
    );
  }
}
