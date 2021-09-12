import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spxplorer/services/api_requestor.dart';
import 'package:spxplorer/spxplorer_nav.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.instance.registerSingleton<SpaceXAPI>(SpaceXAPI());
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpXplorer',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(30, 36, 40, 1),
        primaryColorBrightness: Brightness.dark,
        backgroundColor: Color.fromRGBO(220, 227, 234, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(),
        colorScheme: ColorScheme.highContrastDark(
            primary: Color.fromRGBO(30, 36, 40, 1),
            secondary: Color.fromRGBO(23, 121, 215, 1),
            background: Color.fromRGBO(220, 227, 234, 1),
            brightness: Brightness.dark),
      ),
      home: SpxplorerNav(),
    );
  }
}
