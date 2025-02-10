// This file is part of Hello World Informed
// https://www.aurelitec.com/helloworldinformed/
//
// Copyright 2020-2025 Aurelitec. All rights reserved.
// Licensed under the MIT license. See LICENSE file in the project root for details.

import 'package:flutter/material.dart';

import '../common/app_strings.dart' as app_strings;
import '../data/info_bit.dart';
import '../data/info_bits.dart';
import '../widgets/info_bit_view.dart';

// The storage bucket used to store the scroll position of the info bits list view.
final PageStorageBucket _infoBitListBucket = PageStorageBucket();

/// The Info Bit List screen.
///
/// This screen displays a list of all the info bits, using [InfoBitView] widgets separated by
/// dividers. The user can tap on an info bit to select it and return to the [HomeScreen].
class InfoBitListScreen extends StatelessWidget {
  /// Creates an [InfoBitListScreen] instance.
  const InfoBitListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Use a [PageStorage] widget to store and restore the scroll position of the list view.
    return PageStorage(
      bucket: _infoBitListBucket,
      child: Scaffold(
        // A simple app bar with just the screen title.
        appBar: AppBar(
          title: const Text(app_strings.infoBitListScreenTitle),
        ),

        // The body of the screen is a list view of the info bits.
        body: ListView.separated(
          key: const PageStorageKey('info_bit_list_view'),
          itemCount: infoBits.length,
          itemBuilder: (BuildContext context, int index) {
            final InfoBit infoBit = infoBits[index];
            return InkWell(
              // When the user taps on an info bit, return to the [HomeScreen] with the selected
              // info bit.
              onTap: () => Navigator.pop<InfoBit>(context, infoBit),

              // Display the info bit using an [InfoBitView] widget.
              child: InfoBitView(
                infoBit: infoBit,
                isListView: true,
              ),
            );
          },

          // Add a divider between each info bit.
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        ),
      ),
    );
  }
}
