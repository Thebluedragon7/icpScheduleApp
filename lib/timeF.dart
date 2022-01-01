import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class RemainingTime extends StatefulWidget {
  final String startTime;
  final String endTime;

  const RemainingTime(
      {Key? key, required this.startTime, required this.endTime})
      : super(key: key);

  @override
  _RemainingTimeState createState() => _RemainingTimeState();
}

class _RemainingTimeState extends State<RemainingTime> {

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final startingTime = DateFormat("h:mma").parse(widget.startTime);
    final endingTime = DateFormat("h:mma").parse(widget.endTime);
    String _timeToStart = '';
    String _timeToEnd = '';
    return Container();
  }
}
