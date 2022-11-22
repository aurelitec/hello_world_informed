class InfoBit {
  static const String infoPlaceholder = '{INFO}';

  final String title;
  final String text;
  final String? value;

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
