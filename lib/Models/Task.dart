import 'package:intl/intl.dart';

final DateFormat formatter = DateFormat.yMd();
class Task {
  final String title;
  final DateTime date;

  Task({required this.title, required this.date});

  String get formattedDate {
    return formatter.format(date);
  }
}