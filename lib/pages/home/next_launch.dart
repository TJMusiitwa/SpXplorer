import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spxplorer/pages/launches/launchDetails.dart';
import 'package:spxplorer/services/spacexAPIState.dart';

class NextLaunchWidget extends ConsumerWidget {
  const NextLaunchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var nextLaunchData = watch(nextLaunchFuture);
    return nextLaunchData.when(
        data: (launch) => InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LaunchDetails(
                      launch: launch,
                    ),
                  )),
              child: Card(
                child: ListTile(
                  leading: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Flight'),
                        Text(launch.flightNumber.toString())
                      ],
                    ),
                  ),
                  title: Text(launch.name),
                  subtitle: Text(launch.dateLocal.toLocal().toString()),
                ),
              ),
            ),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('${error.toString()}')));
  }
}
