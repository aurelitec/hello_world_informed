// This file is part of Hello World Informed
// https://www.aurelitec.com/helloworldinformed/
//
// Copyright 2020-2025 Aurelitec. All rights reserved.
// Licensed under the MIT license. See LICENSE file in the project root for details.

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
        dividerTheme: DividerThemeData(
          color: Colors.white.withValues(alpha: 0.25),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),

      // The home screen of the app.
      home: const HomeScreen(),
    );
  }
}
