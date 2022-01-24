import 'package:flutter/cupertino.dart';
import 'package:icp_bit_schedule/icpProviders/icpTimeProvider.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/api/timeAlgorithm.dart';
import 'core/icpDatas.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'icpSplashScreens/classesOverForToday.dart';

class ICPCompSchedule extends StatefulWidget {
  final String day;
  final bool firstClassEnded;

  const ICPCompSchedule(
      {Key? key, required this.day, this.firstClassEnded = false})
      : super(key: key);

  @override
  State<ICPCompSchedule> createState() => _ICPCompScheduleState();
}

class _ICPCompScheduleState extends State<ICPCompSchedule> {



  bool _firstCountDown = true;
  bool _secondCountDown = false;

  @override
  void initState() {
    super.initState();
    context.read<ICPTimeProvider>().loadAll();
  }

  @override
  Widget build(BuildContext context) {

    print(MediaQuery.of(context).size.height);
    print(MediaQuery.of(context).size.width);
    /*
      Responsive section;
      card height, font size and other adjustments
     */
    double smallCardHeight =  MediaQuery.of(context).size.height * 0.04;
    double smallCardWidth =  MediaQuery.of(context).size.width * 0.3;

    double topBottomCardHeight = MediaQuery.of(context).size.height * 0.1;
    double topBottomCardWidth = MediaQuery.of(context).size.width * 0.85;

    double fontSize1 = 0.0;
    double fontSize2 = 0.0;
    double fontSize3 = 16;
    double fontSize4 = 0.0;

    int _endMin;
    bool _endingCard = (context.watch<ICPTimeProvider>().periodIndex == 0) ? context.watch<ICPTimeProvider>().firstClassEnded : context.watch<ICPTimeProvider>().secondClassEnded;
    bool _startingCard = (context.watch<ICPTimeProvider>().periodIndex == 0) ? context.watch<ICPTimeProvider>().firstClassStarted : context.watch<ICPTimeProvider>().secondClassStarted;
    DateTime date = DateTime.now();
    String timeLeft = DateFormat("h:mma").format(date);

    var classTimeRemaining = remainingTime(timeLeft, week[widget.day]![context.watch<ICPTimeProvider>().periodIndex].startTime);
    _firstCountDown = !classTimeRemaining[0];
    _secondCountDown = classTimeRemaining[0];

    _endMin = 90;
    // if (classTimeRemaining[0]) {} subtract time from end time or 90 minutes

    return Consumer<ICPTimeProvider>(
      builder: (context, notifier, child) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              color: Colors.redAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)
              ),
              elevation: 12,
              child: SizedBox(
                height: topBottomCardHeight,
                width: topBottomCardWidth,
                child: Center(
                    child: Text(
                      widget.day,
                      style: const TextStyle(
                          fontSize: 52,
                          color: Colors.white70
                      ),
                    )
                ),
              ),
            ),
            Card(
              elevation: 14,
              color: Colors.white,
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "${week[widget.day]![notifier.periodIndex].type} Class",
                      style: const TextStyle(
                        color: Colors.redAccent,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(_startingCard ? "Started at" : "Starts at"),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            color: _startingCard
                                ? Colors.grey
                                : Colors.redAccent,
                            child: SizedBox(
                              height: smallCardHeight,
                              width: smallCardWidth,
                              child: Center(
                                child: Text(
                                  week[widget.day]![notifier.periodIndex].startTime,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: _startingCard
                                          ? Colors.black
                                          : Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        week[widget.day]![notifier.periodIndex].moduleCode,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Text(_endingCard ? "Ended at" : "Ends at"),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            color:
                            _endingCard ? Colors.grey : Colors.redAccent,
                            child: SizedBox(
                              height: smallCardHeight,
                              width: smallCardWidth,
                              child: Center(
                                child: Text(
                                  week[widget.day]![notifier.periodIndex].endTime,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: _endingCard
                                          ? Colors.black
                                          : Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.021,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      week[widget.day]![notifier.periodIndex].moduleTitle,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Card(
                    elevation: 8,
                    color: Colors.white70,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: SizedBox(
                      width: topBottomCardWidth,
                      height: topBottomCardHeight,
                      child: Center(
                        child: Text(
                          "${week[widget.day]![notifier.periodIndex].room}\n${week[widget.day]![notifier.periodIndex].block} Block",
                          style: const TextStyle(
                              // fontSize: fontSize3,
                              color: Colors.black38),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(week[widget.day]![notifier.periodIndex].lecturer,
                      style: const TextStyle(
                          fontSize: 22,
                          fontFamily: 'OpenSansCondensed-LightItalic',
                          color: Colors.black,
                          fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Column(
              children: [
                Visibility(
                  visible: _firstCountDown,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    color: Colors.redAccent,
                    elevation: 6,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.18,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Starts in',
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                          ),
                          TimerCountdown(
                            format: CountDownTimerFormat.hoursMinutesSeconds,
                            endTime: DateTime.now().add(
                              Duration(
                                minutes: classTimeRemaining[1],
                              ),
                            ),
                            onEnd: () {
                              // Turns Phone to Silent Mode
                              setState(() {
                                if (!notifier.firstClassStarted) {
                                  notifier.firstStarted();
                                } else if (notifier.firstClassStarted && !notifier.secondClassStarted) {
                                  notifier.secondStarted();
                                }
                                _firstCountDown = false;
                                _secondCountDown = true;
                              });

                            },
                            enableDescriptions: false,
                            colonsTextStyle: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.height * 0.09,
                            ),
                            timeTextStyle: TextStyle(
                                color: Colors.white,
                                fontSize:
                                MediaQuery.of(context).size.height * 0.105),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: _secondCountDown,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    color: Colors.redAccent,
                    elevation: 6,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.18,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Class Ends in",
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                          ),
                          TimerCountdown(
                            format: CountDownTimerFormat.hoursMinutesSeconds,
                            endTime: DateTime.now().add(
                              Duration(
                                minutes: _endMin,
                              ),
                            ),
                            onEnd: () {
                              // if (periodIndex == 0) => Restart and send Notifications
                              // else Day ended Page
                              // finally Turns off Silent Mode
                              setState(() {
                                if (!notifier.firstClassEnded) {
                                  notifier.firstEnded();
                                }
                                else if (!notifier.secondClassEnded) {
                                  notifier.reset();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const ClassesOverForToday()));
                                }
                              });

                            },
                            enableDescriptions: false,
                            colonsTextStyle: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.height * 0.09,
                            ),
                            timeTextStyle: TextStyle(
                              color: Colors.white,
                              fontSize:
                              MediaQuery.of(context).size.height * 0.105,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: !notifier.secondClassStarted,
              child: CupertinoButton(
                  child: const Text('Next'),
                  color: Colors.orangeAccent,
                  onPressed: () {
                    showBottomSheet(
                        context: context,
                        builder: (BuildContext context) => Container(
                          color: Colors.white,
                          child: ListView(
                            shrinkWrap: true,
                            primary: true,
                            children: [
                              ListTile(
                                dense: false,
                                title: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  color: Colors.red,
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.15,
                                    width: MediaQuery.of(context).size.width,
                                    child: Center(
                                      child: Text(
                                        week[widget.day]![1]
                                            .moduleTitle,
                                        style: const TextStyle(
                                            fontSize: 32,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Center(
                                  child: Text(
                                    "${week[widget.day]![1]
                                        .type} class",
                                    style: const TextStyle(
                                        fontSize: 22,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                              ),
                              ListTile(
                                textColor: Colors.red,
                                title: Text(week[widget.day]![1].room,
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w700
                                  ),),
                                trailing: Text("${week[widget.day]![1].block} Block",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w700
                                  ),),
                              ),
                              ListTile(
                                textColor: Colors.redAccent,
                                title: Center(
                                  child: RichText(
                                    text: TextSpan(
                                      text: "by\t\t\t",
                                      style: TextStyle(
                                        color: Colors.red
                                      ),
                                      children: [
                                        TextSpan(
                                          text: week[widget.day]![1].lecturer,
                                          style: TextStyle(
                                            fontFamily: "OpenSansCondensed-LightItalic",
                                            color: Colors.redAccent,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w700
                                          )
                                        ),
                                      ]
                                    ),
                                  ),
                                ),
                              ),
                              ButtonBar(
                                children: [
                                  TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("Okay",
                                        style: TextStyle(
                                            color: Colors.red
                                        ),))
                                ],
                              ),
                            ],
                          ),
                        ));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
