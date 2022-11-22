import 'package:flutter/material.dart';

import 'common/app_strings.dart' as app_strings;
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: app_strings.appName,
      theme: ThemeData(
        brightness: Brightness.light,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        colorScheme: const ColorScheme.light(
          primary: Colors.black,
          surface: Colors.black,
          onSurface: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
