import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
import '/utils/color.dart';
import '/widgets/common_top_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UpgradePlan extends StatefulWidget {
  UpgradePlan({super.key});

  @override
  State<UpgradePlan> createState() => _UpgradePlanState();
}

class _UpgradePlanState extends State<UpgradePlan> {
  final ScrollController scrollController = ScrollController();

  final ScrollController scrollHeaderController = ScrollController();

  final StreamController<double> scrollPosition = StreamController();

  final StreamController<double> scrollHeaderPosition = StreamController();
  double offset = 0.0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CommonTopBar(title: 'Upgrade Plans'),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12.0),
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
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 3,
                          spreadRadius: 1,
                          color: Color.fromARGB(255, 213, 212, 212),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Plans We Offers!',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Checkout our plans and choose the right plan according to your business needs.',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 2,
                              spreadRadius: 1,
                              color: Color.fromARGB(255, 221, 220, 220),
                              offset: Offset(0, 3)),
                        ],
                      ),
                      width: double.infinity,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6),
                                topRight: Radius.circular(6),
                              ),
                              color: ColorStyle.colorPrimary,
                            ),
                            width: double.infinity,
                            height: 55,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                FaIcon(
                                  FontAwesomeIcons.telegram,
                                  color: Colors.white,
                                  size: 36,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'LITE',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      'FREE',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          StreamBuilder<double>(
                            initialData: 0.0,
                            stream: scrollPosition.stream,
                            builder: (context, snapshot) {
                              return Expanded(
                                child: Stack(
                                  children: [
                                    StreamBuilder<double>(
                                      initialData: 0.0,
                                      stream: scrollHeaderPosition.stream,
                                      builder: (context, snapshot) {
                                        return Container(
                                          height: 20,
                                          color: snapshot.data != 0.0
                                              ? Colors.blue
                                              : Colors.transparent,
                                        );
                                      },
                                    ),
                                    ListView.builder(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 10,
                                      ),
                                      controller: scrollController,
                                      itemCount: 6,
                                      itemBuilder: (context, index) {
                                        scrollController.addListener(
                                          () => scrollHeaderPosition
                                              .add(scrollController.offset),
                                        );
                                        return StickyHeaderBuilder(
                                          overlapHeaders: false,
                                          builder: (context, stuckAmount) {
                                            return Container(
                                              // color:
                                              //     scrollController.offset == 0.0
                                              //         ? Colors.transparent
                                              //         : Colors.blue,
                                              child: Text(
                                                  'GENERAL FEATURES $index'),
                                            );
                                          },
                                          content: ListView(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 10,
                                            ),
                                            scrollDirection: Axis.vertical,
                                            shrinkWrap: true,
                                            children: [
                                              Text('hello'),
                                              Text('hello'),
                                              Text('hello'),
                                              Text('hello'),
                                              Text('hello'),
                                              Text('hello'),
                                              Text('hello'),
                                              Text('hello'),
                                              Text('hello'),
                                              Text('hello'),
                                              Text('hello'),
                                              Text('hello'),
                                              Text('hello'),
                                              Text('hello'),
                                              Text('hello'),
                                              Text('hello'),
                                              Text('hello'),
                                              Text('hello'),
                                              Text('hello'),
                                              Text('hello'),
                                              Text('hello'),
                                              Text('hello'),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(scrollController.offset);
        },
      ),
    );
  }
}
