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
            Card(
              color: Colors.redAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)
              ),
              elevation: 12,
              child: SizedBox(
                height: 85,
                width: 295,
                child: Center(
                    child: Text(
                      _today,
                      style: const TextStyle(
                          fontSize: 52,
                          color: Colors.white70
                      ),
                    )
                ),
              ),
            ),
            ICPCompSchedule(day: _today,),
          ],
        ),
      ),
    );
  }
}
