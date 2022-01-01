import 'package:flutter/material.dart';
import 'package:icp_bit_schedule/drawer/icpDrawer.dart';

class ICPUserLog extends StatefulWidget {
  const ICPUserLog({Key? key}) : super(key: key);

  @override
  _ICPUserLogState createState() => _ICPUserLogState();
}

class _ICPUserLogState extends State<ICPUserLog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const ICPDrawer(),
      body: Container(),
    );
  }
}
