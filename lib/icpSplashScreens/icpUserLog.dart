import 'package:flutter/material.dart';
import 'package:icp_bit_schedule/drawer/icpDrawer.dart';

class ICPUserLog extends StatelessWidget {
  const ICPUserLog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ICPForm()),
    );
  }
}

class ICPForm extends StatefulWidget {
  const ICPForm({Key? key}) : super(key: key);

  @override
  _ICPFormState createState() => _ICPFormState();
}

class _ICPFormState extends State<ICPForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
          ),
        ],
      ),
    );
  }
}

