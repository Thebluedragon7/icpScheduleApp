import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icp_bit_schedule/core/icpDatas.dart';
import 'package:intl/intl.dart';

class DrawerICPSchedule extends StatelessWidget {
  const DrawerICPSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    String _today = DateFormat('EEEE').format(date);
    final List<String> dayList = week.keys.toList();
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
            length: week.length,
            child: Builder(
              builder: (BuildContext context) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const TabPageSelector(),
                    Expanded(
                      child: TabBarView(
                        children: [
                          for (int i = 0; i < dayList.length; i++)
                            Column(
                              children: [
                                Card(
                                  elevation: 6,
                                  color: Colors.white70,
                                  child: SizedBox(
                                    child: Center(
                                        child: Text(
                                      dayList[i],
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.065),
                                    )),
                                    height: MediaQuery.of(context).size.height *
                                        0.09,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Card(
                                  color: Colors.red,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    width: MediaQuery.of(context).size.width,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Center(
                                            child: Text(
                                              week[dayList[i]]![0].moduleTitle,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          const Spacer(),
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  const Text('Starts at'),
                                                  Card(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30)),
                                                    child: SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.2,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.028,
                                                      child: Center(
                                                          child: Text(
                                                        week[dayList[i]]![0]
                                                            .startTime,
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      )),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const Spacer(),
                                              Text(
                                                week[dayList[i]]![0].type,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 24,
                                                    color: Colors.white70),
                                              ),
                                              const Spacer(),
                                              Column(
                                                children: [
                                                  const Text('Ends at'),
                                                  Card(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30)),
                                                    child: SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.2,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.028,
                                                      child: Center(
                                                          child: Text(
                                                        week[dayList[i]]![0]
                                                            .endTime,
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      )),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Card(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.09,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.9,
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: RichText(
                                                    text: TextSpan(
                                                        text:
                                                            week[dayList[i]]![0]
                                                                .room,
                                                        style: const TextStyle(
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors.red),
                                                        children: [
                                                      TextSpan(
                                                          text:
                                                              '\non\t\t\t\t\t\t\t\t',
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .black87),
                                                          children: [
                                                            TextSpan(
                                                              text:
                                                                  '${week[dayList[i]]![0].block} Block',
                                                              style: const TextStyle(
                                                                  fontSize: 25,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .red),
                                                            )
                                                          ]),
                                                    ])),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                Card(
                                  color: Colors.red,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    width: MediaQuery.of(context).size.width,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Center(
                                            child: Text(
                                              week[dayList[i]]![1].moduleTitle,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          const Spacer(),
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  const Text('Starts at'),
                                                  Card(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30)),
                                                    child: SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.2,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.028,
                                                      child: Center(
                                                          child: Text(
                                                        week[dayList[i]]![1]
                                                            .startTime,
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      )),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const Spacer(),
                                              Text(
                                                week[dayList[i]]![1].type,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 24,
                                                    color: Colors.white70),
                                              ),
                                              const Spacer(),
                                              Column(
                                                children: [
                                                  const Text('Ends at'),
                                                  Card(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30)),
                                                    child: SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.2,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.028,
                                                      child: Center(
                                                          child: Text(
                                                        week[dayList[i]]![1]
                                                            .endTime,
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      )),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Card(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            child: SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.09,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.9,
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: RichText(
                                                    text: TextSpan(
                                                        text:
                                                            week[dayList[i]]![1]
                                                                .room,
                                                        style: const TextStyle(
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors.red),
                                                        children: [
                                                      TextSpan(
                                                          text:
                                                              '\non\t\t\t\t\t\t\t\t',
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .black87),
                                                          children: [
                                                            TextSpan(
                                                              text:
                                                                  '${week[dayList[i]]![1].block} Block',
                                                              style: const TextStyle(
                                                                  fontSize: 25,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .red),
                                                            )
                                                          ]),
                                                    ])),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                        ],
                      ),
                    ),
                    CupertinoButton(
                      color: Colors.red,
                        onPressed: () {
                          final TabController _todayTabController =
                              DefaultTabController.of(context)!;
                          if (!_todayTabController.indexIsChanging) {
                            _todayTabController
                                .animateTo(dayList.indexOf(_today));
                          }
                        },
                        child: const Text('Today'),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
