import 'package:flutter/material.dart';

import '../data/info_bit.dart';

class InfoBitView extends StatelessWidget {
  const InfoBitView({Key? key, required this.infoBit}) : super(key: key);

  final InfoBit infoBit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: _parseInfoBit(),
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }

  List<InlineSpan> _parseInfoBit() {
    List<InlineSpan> widgets = [];

    infoBit.text.splitMapJoin(
      '{INFO}',
      onMatch: (Match match) {
        if (infoBit.value != null) {
          widgets.add(
            TextSpan(
              text: infoBit.value,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        }
        return '';
      },
      onNonMatch: (String text) {
        widgets.add(TextSpan(text: text));
        return '';
      },
    );

    return widgets;
  }
}
