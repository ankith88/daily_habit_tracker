import 'package:flutter/foundation.dart';

class Habbits {
  final String id;
  final String title;
  int completedDaysCount;
  int totalDaysCount;
  final DateTime dateStarted;

  Habbits(
      {required this.id,
      required this.title,
      required this.completedDaysCount,
      required this.totalDaysCount,
      required this.dateStarted});
}
