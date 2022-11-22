// Copyright 2020-2022 TechAurelian. All rights reserved.
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

/// The Info Bit data model.
///
/// This class is used to store the data for an info bit.
class InfoBit {
  /// The placeholder in the text of an info bit that should be replaced with the actual value.
  static const String infoPlaceholder = '{INFO}';

  /// The title of the info bit, like "manufacturer" or "version.release".
  final String title;

  /// The text of the info bit.
  final String text;

  /// The actual value of the info bit, like "Motorola" or "13".
  final String? value;

  /// Creates an [InfoBit] instance with the given [title], [text] and [value].
  InfoBit({
    required this.title,
    required this.text,
    this.value,
  });

  @override
  String toString() {
    return '${text.replaceAll(infoPlaceholder, value ?? '')} ($title)';
  }
}
