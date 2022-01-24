import 'package:flutter/material.dart';
import 'package:icp_bit_schedule/drawer/icpDrawer.dart';
import 'package:icp_bit_schedule/icpCompSchedule.dart';
import 'package:intl/intl.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'core/api/timeAlgorithm.dart';

class ICPHome extends StatelessWidget {
  const ICPHome({Key? key}) : super(key: key);

  final classStartID = 81628162;

  @override
  Widget build(BuildContext context) {
    AndroidAlarmManager.oneShotAt(DateTime.now(), classStartID, icpStart);
    DateTime date = DateTime.now();
    final _today = DateFormat('EEEE').format(date);
    return Scaffold(
      backgroundColor: Colors.red,
      drawer: const ICPDrawer(),
      body: SafeArea(
        child: Column(
          children: [

            ICPCompSchedule(day: _today,),
          ],
        ),
      ),
    );
  }
}
