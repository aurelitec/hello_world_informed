// This file is part of Hello World Informed
// https://www.aurelitec.com/helloworldinformed/
//
// Copyright 2020-2025 Aurelitec. All rights reserved.
// Licensed under the MIT license. See LICENSE file in the project root for details.

import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

/// Shows a default [SnackBar] with the specified text, after hiding any previous snack bars.
void showSnackBar(BuildContext context, String text) {
  final SnackBar snackBar = SnackBar(content: Text(text));
  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(snackBar);
}

/// Launches the specified [URL] in the mobile platform, using the default external application.
Future<void> launchUrlExternal(BuildContext context, String url) async {
  await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
}
