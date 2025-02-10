// This file is part of Hello World Informed
// https://www.aurelitec.com/helloworldinformed/
//
// Copyright 2020-2025 Aurelitec. All rights reserved.
// Licensed under the MIT license. See LICENSE file in the project root for details.

import 'package:flutter/material.dart';

import 'package:share_plus/share_plus.dart';

import '../common/app_const.dart' as app_const;
import '../common/app_strings.dart' as app_strings;
import '../data/info_bit.dart';
import '../data/info_bits.dart';
import '../utils/utils.dart' as utils;
import '../widgets/info_bit_view.dart';
import 'info_bit_list_screen.dart';

/// The home screen of the app.
///
/// Displays a random [InfoBit] and a button to shuffle the displayed info bit. The app bar has
/// actions to navigate to the [InfoBitListScreen], share the displayed info bit, and other
/// app-related actions.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// The current info bit to display.
  InfoBit? _infoBit;

  @override
  void initState() {
    super.initState();
    _initInfoBits();
  }

  /// Initializes the info bits with information from the device, and updates the current info bit
  /// with a random one.
  Future<void> _initInfoBits() async {
    await buildInfoBits();
    _shuffleInfoBit();
  }

  /// Updates the current info bit with a random one.
  void _shuffleInfoBit() {
    setState(() {
      _infoBit = getRandomInfoBit();
    });
  }

  /// Performs the actions of the app bar.
  Future<void> _onAppBarAction(_AppBarActions action) async {
    switch (action) {
      // Navigate to the Info Bit List screen, and update the current info bit if the user selects
      // one from the list.
      case _AppBarActions.list:
        final InfoBit? infoBit = await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const InfoBitListScreen()),
        );
        if (infoBit != null) {
          setState(() {
            _infoBit = infoBit;
          });
        }
        break;

      // Share the info bit.
      case _AppBarActions.share:
        Share.share(_infoBit.toString(), subject: app_strings.appName);
        break;

      // Open the Google Play app page to allow the user to rate the app.
      case _AppBarActions.rate:
        utils.launchUrlExternal(context, app_const.rateAppUrl);
        break;

      // Open the app home page in the default browser.
      case _AppBarActions.what:
        utils.launchUrlExternal(context, app_const.appHomeUrl);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(
        onAction: _onAppBarAction,
      ),

      // The body of the screen displays the current info bit if it is not null (i.e. if the info bits have been
      // initialized).
      body: _infoBit != null
          ? InfoBitView(infoBit: _infoBit!)
          : const Center(child: CircularProgressIndicator()),

      // The floating action button shuffles the info bit.
      floatingActionButton: FloatingActionButton.large(
        tooltip: app_strings.homeFabTooltip,
        onPressed: _shuffleInfoBit,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

/// The actions available in the app bar.
enum _AppBarActions { list, share, rate, what }

/// The app bar of the home screen.
class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar({
    // ignore: unused_element
    super.key,
    required this.onAction,
  });

  /// The callback that is called when an app bar action is pressed.
  final Function(_AppBarActions action) onAction;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(app_strings.homeScreenTitle),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.view_list),
          tooltip: app_strings.homeListTooltip,
          onPressed: () => onAction(_AppBarActions.list),
        ),
        PopupMenuButton<_AppBarActions>(
          onSelected: onAction,
          itemBuilder: (BuildContext context) => <PopupMenuEntry<_AppBarActions>>[
            const PopupMenuItem<_AppBarActions>(
              value: _AppBarActions.share,
              child: Text(app_strings.shareAction),
            ),
            const PopupMenuItem<_AppBarActions>(
              value: _AppBarActions.rate,
              child: Text(app_strings.rateAction),
            ),
            const PopupMenuItem<_AppBarActions>(
              value: _AppBarActions.what,
              child: Text(app_strings.appHomeAction),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
