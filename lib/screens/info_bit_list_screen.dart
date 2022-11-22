// Copyright 2020-2022 TechAurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import '../common/app_strings.dart' as app_strings;
import '../data/info_bit.dart';
import '../data/info_bits.dart';
import '../widgets/info_bit_view.dart';

// The storage bucket used to store the scroll position of the info bits list view.
final PageStorageBucket _infoBitListBucket = PageStorageBucket();

class InfoBitListScreen extends StatelessWidget {
  const InfoBitListScreen({Key? key}) : super(key: key);

  void _onInfoBitTap(BuildContext context, InfoBit infoBit) {
    Navigator.pop<InfoBit>(context, infoBit);
  }

  @override
  Widget build(BuildContext context) {
    return PageStorage(
      bucket: _infoBitListBucket,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(app_strings.infoBitListScreenTitle),
        ),
        body: ListView.separated(
          key: const PageStorageKey('info_bit_list_view'),
          itemCount: infoBits.length,
          itemBuilder: (BuildContext context, int index) {
            final InfoBit infoBit = infoBits[index];
            return InkWell(
              onTap: () => _onInfoBitTap(context, infoBit),
              child: InfoBitView(
                infoBit: infoBit,
                isListView: true,
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        ),
      ),
    );
  }
}
