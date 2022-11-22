import 'package:flutter/material.dart';

import '../data/info_bit.dart';

class InfoBitView extends StatelessWidget {
  const InfoBitView({
    Key? key,
    required this.infoBit,
    this.isListView = false,
  }) : super(key: key);

  final InfoBit infoBit;

  final bool isListView;

  @override
  Widget build(BuildContext context) {
    final TextAlign textAlign = isListView ? TextAlign.left : TextAlign.center;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            infoBit.title,
            style: Theme.of(context).textTheme.caption,
            textAlign: textAlign,
          ),
          const SizedBox(height: 4.0),
          RichText(
            textAlign: textAlign,
            text: TextSpan(
              children: _parseInfoBit(),
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ],
      ),
    );

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
