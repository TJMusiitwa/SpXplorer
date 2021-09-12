import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:spxplorer/services/spacexAPIState.dart';

class RoadsterPage extends ConsumerWidget {
  const RoadsterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var roadster = watch(roadsterFuture);
    var launchDtFmt = DateFormat('d MMMM y').add_jm();
    var distanceFmt = NumberFormat.decimalPattern();
    return roadster.when(
      data: (roadsterData) => Material(
        child: CustomScrollView(
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
                          .bodyText1!
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
                            // roadsterData.launchDateUtc
                            //     .toLocal()
                            //     .toString()
                            //     .split(' ')[0],
                            launchDtFmt.format(roadsterData.launchDateUtc),
                            style: Theme.of(context).textTheme.headline6,
                          )),
                    ),
                    Card(
                      child: ListTile(
                        title: Text('Earth Distance(Km)'),
                        subtitle: Text(
                          //roadsterData.earthDistanceKm.toString(),
                          distanceFmt.format(roadsterData.earthDistanceKm),
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text('Mars Distance(Km)'),
                        subtitle: Text(
                          //roadsterData.marsDistanceKm.toString(),
                          distanceFmt.format(roadsterData.marsDistanceKm),
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text('Travel Speed(Kph)'),
                        subtitle: Text(
                          //roadsterData.marsDistanceKm.toString(),
                          distanceFmt.format(roadsterData.speedKph),
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('${error.toString()}')),
    );
  }
}
