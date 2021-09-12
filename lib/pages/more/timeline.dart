import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:spxplorer/services/spacexAPIState.dart';
import 'package:timelines/timelines.dart';

class TimelinePage extends ConsumerWidget {
  const TimelinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var timelineData = watch(allHistoryFuture);
    return Scaffold(
      appBar: AppBar(
        title: Text('Timeline'),
      ),
      body: timelineData.when(
        data: (timeline) => Timeline.builder(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) {
              var data = timeline[index];
              return TimelineTile(
                oppositeContents: Text(
                  DateFormat('d MMMM y').add_jm().format(data.eventDateUtc),
                  softWrap: true,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                ),
                nodeAlign: TimelineNodeAlign.start,
                contents: Card(
                    child: ListTile(
                  title: Text(data.title, overflow: TextOverflow.ellipsis),
                  subtitle: Text(
                    data.details,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                  isThreeLine: true,
                  trailing: IconButton(
                      onPressed: () => print(data.links!.article),
                      icon: Icon(Icons.open_in_new)),
                )),
                node: TimelineNode(
                  indicator: DotIndicator(),
                  startConnector: SolidLineConnector(),
                  endConnector: SolidLineConnector(),
                ),
              );
            },
            itemCount: timeline.length),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('${error.toString()}')),
      ),
    );
  }
}
