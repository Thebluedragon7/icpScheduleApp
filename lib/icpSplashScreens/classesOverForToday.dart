import 'package:flutter/material.dart';
import 'package:icp_bit_schedule/drawer/icpDrawer.dart';

class ClassesOverForToday extends StatelessWidget {
  const ClassesOverForToday({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const ICPDrawer(),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.red,
          child: Column(
            children: [
              Card(
                elevation: 22,
                  color: Colors.white70,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Center(child: Text("Classes for today are Over!")),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
