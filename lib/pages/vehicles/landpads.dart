import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spxplorer/services/spacexAPIState.dart';
import 'package:spxplorer/widgets/info_card.dart';

class LandpadsTab extends ConsumerWidget {
  const LandpadsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var landpads = watch(allLandpadsFuture);
    return landpads.when(
      data: (data) => ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          var landpad = data[index];
          return InfoCard(
              tagID: landpad.id,
              title: landpad.fullName,
              subtitle: '${landpad.locality}, ${landpad.region}',
              image: CachedNetworkImageProvider(
                landpad.images.large.first,
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
