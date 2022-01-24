import 'package:flutter/material.dart';
import 'package:icp_bit_schedule/icpHome.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:icp_bit_schedule/icpProviders/icpNotificationProvider.dart';
import 'package:icp_bit_schedule/icpProviders/icpUserProvider.dart';
import 'package:icp_bit_schedule/icpSplashScreens/classesOverForToday.dart';
import 'package:provider/provider.dart';
import 'icpProviders/icpTimeProvider.dart';
import 'icpProviders/routeProvider.dart';
import 'icpSplashScreens/icpUserLog.dart';

void main() async {
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ICPUserProvider()),
      ChangeNotifierProvider(create: (_) => ICPNotificationProvider()),
      ChangeNotifierProvider(create: (_) => ICPTimeProvider()),
    ],
    // child: Consumer<RouteProvider>(
    //   builder: (context, notifier, child) => MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     initialRoute: notifier.icpRoute,
    //     routes: {
    //       '/home': (context) => ICPHome(),
    //       '/userSetup': (context) => ICPUserLog(),
    //       '/classesOver': (context) => ClassesOverForToday()
    //     },
    //   ),
    // ),
    child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        routes: {
          '/home': (context) => ICPHome(),
          '/userSetup': (context) => ICPUserLog(),
          '/classesOver': (context) => ClassesOverForToday()
        },
      ),
    ),
  );
  await AndroidAlarmManager.initialize();
}
