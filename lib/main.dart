// Copyright 2020-2022 TechAurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'common/app_strings.dart' as app_strings;
import 'screens/home_screen.dart';

void main() {
  runApp(const HelloWorldInformedApp());
}

/// The main app widget, which is the root of the app.
class HelloWorldInformedApp extends StatelessWidget {
  /// Creates a [HelloWorldInformedApp].
  const HelloWorldInformedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: app_strings.appName,

      // A Material Design 3 black and white app theme.
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          primary: Colors.black,
          surface: Colors.black,
          onSurface: Colors.white,
        ),
        useMaterial3: true,
      ),

      // The home screen of the app.
      home: const HomeScreen(),
    );
  }
}
