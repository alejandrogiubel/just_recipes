extension StringExtension on String {
  String get inCaps =>
      isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : '';
  String get allInCaps => toUpperCase();
  String get capitalizeFirstOfEach =>
      split(' ').map<dynamic>((str) => str.inCaps).join(' ');
}
