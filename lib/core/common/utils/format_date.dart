import 'package:intl/intl.dart';

String formatDateBydMMMYYYY(DateTime time) {
  return DateFormat("d MMM, yyyy").format(time);
}
