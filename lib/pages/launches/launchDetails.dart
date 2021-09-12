import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spxplorer/models/models.dart';

class LaunchDetails extends StatelessWidget {
  final Launch launch;
  const LaunchDetails({required this.launch, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var singleLaunch = watch(oneLaunchFuture!(id));
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(launch.name),
              background: Hero(
                tag: launch.id,
                child: CachedNetworkImage(
                  imageUrl: launch.links!.patch!.large.toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Text(launch.flightNumber.toString()),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
