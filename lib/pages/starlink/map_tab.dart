import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:platform_maps_flutter/platform_maps_flutter.dart';
import 'package:spxplorer/services/spacexAPIState.dart';

final LatLng initialPosition = const LatLng(25.9972641, -97.1560845);
double zoomVal = 5.0;

class MapTab extends StatefulWidget {
  final Completer<PlatformMapController> mapController = Completer();

  //final PlatformMapController controller = PlatformMapController();

  @override
  State<MapTab> createState() => _MapTabState();
}

class _MapTabState extends State<MapTab> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      var starlinks = watch(allStarlinksQuery).data;
      return PlatformMap(
        initialCameraPosition: CameraPosition(
          target: initialPosition,
          zoom: 12,
        ),
        onMapCreated: (mapController) {
          widget.mapController.complete(mapController);
        },
        onCameraMove: (cameraUpdate) {},
        mapType: MapType.satellite,
        markers: starlinks!.value
            .map((starlink) => Marker(
                markerId: MarkerId(starlink.id),
                position: LatLng(starlink.latitude!.toDouble(),
                    starlink.longitude!.toDouble()),
                icon: BitmapDescriptor.defaultMarker))
            .toSet(),
      );
    });
  }
}
