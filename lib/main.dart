import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';
import 'package:get_instance/get_instance.dart';

import 'package:spxplorer/spxplorer_nav.dart';

void main() {
  Dio spaceXAPI = Dio()
    ..options.baseUrl = "https://api.spacexdata.com/v4"
    ..interceptors.add(DioCacheManager(CacheConfig(
      defaultRequestMethod: "GET",
    )).interceptor);
  Get.put(spaceXAPI);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpXplorer',
      theme: ThemeData(
        primaryColor: Colors.black,
        primaryColorBrightness: Brightness.dark,
        accentColor: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(),
      ),
      home: SpxplorerNav(),
    );
  }
}
