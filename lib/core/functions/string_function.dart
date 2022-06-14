import 'package:intl/intl.dart';

String unixToDay(timestamp) {
  final DateTime date =
      DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp) * 1000);
  String day = DateFormat(DateFormat.ABBR_WEEKDAY).format(date).toString();
  return day;
}

String unixToTime(timestamp) {
  final DateTime date =
      DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp) * 1000);
  String day = DateFormat.Hm().format(date).toString();
  return day;
}

String roundTemp(temp) {
  return double.parse(temp).toStringAsFixed(0);
}
