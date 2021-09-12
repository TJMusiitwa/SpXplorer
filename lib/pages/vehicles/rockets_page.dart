import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spxplorer/services/spacexAPIState.dart';
import 'package:spxplorer/widgets/info_card.dart';

class RocketsPage extends ConsumerWidget {
  const RocketsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var rockets = watch(allRocketsFuture);
    return rockets.when(
      data: (data) => ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          var rocket = data[index];
          return InfoCard(
              tagID: rocket.id,
              title: rocket.name,
              subtitle: '${rocket.company}, ${rocket.country}',
              image: CachedNetworkImageProvider(
                rocket.flickrImages[0],
              ));
        },
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          height: 25,
        ),
      ),
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('${error.toString()}')),
    );
  }
}
