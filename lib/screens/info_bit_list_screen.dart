import 'package:flutter/material.dart';

import '../common/app_strings.dart' as app_strings;
import '../data/info_bits.dart';
import '../widgets/info_bit_view.dart';

class InfoBitListScreen extends StatelessWidget {
  const InfoBitListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(app_strings.infoBitListScreenTitle),
      ),
      body: ListView.separated(
        itemCount: infoBits.length,
        itemBuilder: (BuildContext context, int index) {
          return InfoBitView(
            infoBit: infoBits[index],
            isListView: true,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
    );
  }
}
