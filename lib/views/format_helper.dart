// ignore_for_file: avoid_classes_with_only_static_members

import 'package:intl/intl.dart';

class EuropeanFormatter {
  static String formatPrice(int value) {
    final NumberFormat formatter = NumberFormat.currency(locale: 'fr_BE');
    return formatter.format(value);
  }

  static bool isAfter12152022(DateTime entryDate) {
    // Create a DateTime object for 12.15.2022
    final cutoff = DateTime(2022, 12, 15);

    // Return whether entryDate is after the cutoff
    return entryDate.isAfter(cutoff);
  }
}
