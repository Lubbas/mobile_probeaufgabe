extension StringExtension on String? {
  bool get isUseable => this != null && this!.trim().isNotEmpty;

  String orPlaceholder([String placeholder = "-"]) =>
      isUseable ? this! : placeholder;
}
