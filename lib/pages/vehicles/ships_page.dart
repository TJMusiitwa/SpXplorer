import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spxplorer/services/spacexAPIState.dart';

class ShipsPage extends ConsumerWidget {
  const ShipsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var shipsData = watch(allShipsFuture);
    return shipsData.when(
      data: (value) => ListView.builder(
        itemCount: value.length,
        itemBuilder: (BuildContext context, int index) {
          var shipData = value[index];
          return ListTile(
              leading: Hero(
                tag: shipData.id,
                child: Container(
                  height: 180,
                  width: 100,
                  child: CachedNetworkImage(
                    imageUrl:
                        shipData.image ?? 'https://i.imgur.com/q7UwgBW.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(shipData.name),
              subtitle: Wrap(
                spacing: 6,
                runSpacing: 6,
                children: List<Widget>.generate(
                    shipData.roles!.length,
                    (index) => Chip(
                          label: Text(shipData.roles![index].toString()),
                        )),
              ));
        },
      ),
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('${error.toString()}')),
    );
  }
}
