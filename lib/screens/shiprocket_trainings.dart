import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../models/shiprocket_training.dart';
import '../utils/box_styles.dart';
import '../utils/color.dart';
import 'invoices/all_other_invoices.dart';
import 'invoices/freight_invoices.dart';

class ShipRocketTrainings extends StatefulWidget {
  ShipRocketTrainings({super.key});

  @override
  State<ShipRocketTrainings> createState() => _ShipRocketTrainingsState();
}

class _ShipRocketTrainingsState extends State<ShipRocketTrainings> {
  List<ShiprocketTraining> shiprocketTraining = [
    ShiprocketTraining(
      trainingDate: '29 Sep 2022 | 2:00 PM - 3:00 PM',
      triainingType: 'Order Creation and Processing Module',
    ),
    ShiprocketTraining(
      trainingDate: '29 Sep 2022 | 4:00 PM - 6:00 PM',
      triainingType: 'Daily Session',
    ),
    ShiprocketTraining(
      trainingDate: '29 Sep 2022 | 2:00 PM - 3:00 PM',
      triainingType: 'Post-processing Module',
    ),
    ShiprocketTraining(
      trainingDate: '29 Sep 2022 | 1:15 PM - 6:00 PM',
      triainingType: 'Daily Session',
    ),
    ShiprocketTraining(
      trainingDate: '29 Sep 2022 | 1:15 PM - 6:00 PM',
      triainingType: 'Daily Session',
    ),
    ShiprocketTraining(
      trainingDate: '29 Sep 2022 | 1:15 PM - 6:00 PM',
      triainingType: 'Daily Session',
    ),
    ShiprocketTraining(
      trainingDate: '29 Sep 2022 | 1:15 PM - 6:00 PM',
      triainingType: 'Daily Session',
    ),
    ShiprocketTraining(
      trainingDate: '29 Sep 2022 | 1:15 PM - 6:00 PM',
      triainingType: 'Daily Session',
    ),
  ];
  bool weekSelected = true;

  bool monthSelected = false;
  var format = CalendarFormat.week;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 140,
            decoration: BoxStyles.topBarContainerDecoration,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Color.fromARGB(136, 0, 0, 0),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  'Shiprocket Training',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer()
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                gradient: const LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Color.fromARGB(119, 215, 216, 246),
                    Color.fromARGB(119, 215, 216, 246),
                  ],
                  stops: [
                    0.0,
                    0.23,
                    0.23,
                    1.0,
                  ],
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child:
                    // CustomScrollView(
                    //   slivers: [
                    SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          children: [
                            TableCalendar(
                              firstDay: DateTime.utc(2010, 10, 16),
                              lastDay: DateTime.utc(2030, 3, 14),
                              focusedDay: DateTime.now(),
                              calendarFormat: format,
                              onFormatChanged: (format) {
                                setState(() {
                                  format = format;
                                });
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 216, 215, 215),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            format = CalendarFormat.month;
                                            monthSelected = true;
                                            weekSelected = false;
                                          });
                                        },
                                        child: Container(
                                          width: 70,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 6,
                                          ),
                                          decoration: BoxDecoration(
                                            color: monthSelected
                                                ? ColorStyle
                                                    .colorPrimaryLight100
                                                : Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(7.0),
                                          ),
                                          child: const Text(
                                            'Month',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            format = CalendarFormat.week;
                                            monthSelected = false;
                                            weekSelected = true;
                                          });
                                        },
                                        child: Container(
                                          width: 70,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 6,
                                          ),
                                          decoration: BoxDecoration(
                                            color: weekSelected
                                                ? ColorStyle
                                                    .colorPrimaryLight100
                                                : Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(7.0),
                                          ),
                                          child: const Text(
                                            'Week',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: const [
                                        CircleAvatar(
                                          radius: 5,
                                          backgroundColor: Colors.green,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Available',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Row(
                                      children: const [
                                        CircleAvatar(
                                          radius: 5,
                                          backgroundColor: Colors.orange,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Registered',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 600,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        child: ContainedTabBarView(
                          tabBarProperties: const TabBarProperties(
                            indicatorWeight: 5,
                            indicatorColor: Color.fromARGB(212, 87, 39, 176),
                            labelColor: Color.fromARGB(212, 87, 39, 176),
                            unselectedLabelColor: Color.fromARGB(134, 0, 0, 0),
                            labelPadding: EdgeInsets.all(8),
                          ),
                          tabs: const [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                'Upcoming Trainings',
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                'Registered Trainings',
                              ),
                            ),
                          ],
                          initialIndex: 0,
                          views: [
                            ListView.builder(
                              padding: const EdgeInsets.all(12),
                              itemCount: shiprocketTraining.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                shiprocketTraining[index]
                                                    .triainingType,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                shiprocketTraining[index]
                                                    .trainingDate,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 100,
                                          height: 32,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              elevation: 0,
                                              backgroundColor:
                                                  ColorStyle.colorPrimary,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                            ),
                                            onPressed: () {},
                                            child: const Text(
                                              'Register',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                  ],
                                );
                              },
                            ),
                            Container(
                              alignment: Alignment.topCenter,
                              height: 300,
                              child: SizedBox(
                                width: 250,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Image.asset(
                                      'assets/no-trainings-found.PNG',
                                    ),
                                    const Text(
                                      'No upcoming trainings found',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //   ],
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
