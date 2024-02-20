import 'package:intl/intl.dart';

extension DateTimeFormat on DateTime {
  convertToHumanRead() {
    return DateFormat("EEEE, dd MMM yyyy").format(this);
  }
}
