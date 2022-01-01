import 'package:intl/intl.dart';

String runtimeInitialTime() {
  DateTime date = DateTime.now();
  // String today = DateFormat('EEEE').format(date);
  String runtimeTime = DateFormat("h:mma").format(date);
  return runtimeTime;
}