import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final ThemeData spxplorerTheme = ThemeData(
    primaryColor: Color.fromRGBO(30, 36, 40, 1),
    primaryColorBrightness: Brightness.dark,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: Typography.blackMountainView,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        primary: Color.fromRGBO(30, 36, 40, 1),
        secondary: Color.fromRGBO(23, 121, 215, 1),
        background: Color.fromRGBO(220, 227, 234, 1),
        brightness: Brightness.dark
        //onBackground: Colors.black,
        ));
