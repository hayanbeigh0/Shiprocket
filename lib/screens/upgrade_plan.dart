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
  List<String> list = [
    'GENERAL FEATURES',
    'SHIPPING TOOLS AND FEATURES',
    'SHIPPING TOOLS AND tool',
    'SHIPPING TOOLS AND FEATURES',
    'SHIPPING TOOLS AND FEATURES',
    'SHIPPING TOOLS AND FEATURES',
  ];
  final ScrollController scrollController = ScrollController();

  final ScrollController scrollHeaderController = ScrollController();

  final StreamController<double> scrollPosition = StreamController();
  final StreamController<String> string = StreamController();

  final StreamController<double> scrollHeaderPosition =
      StreamController.broadcast();
  GlobalKey itemKey = GlobalKey();
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
                          // use sticky headers to just get the text and then put that text into a stream controller and then use that stream controller to display the text on the screen.

                          Expanded(
                            child: Stack(
                              children: [
                                ListView.builder(
                                  key: itemKey,
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                  ),
                                  controller: scrollController,
                                  itemCount: 6,
                                  itemBuilder: (context, index) {
                                    scrollController.addListener(
                                      () {
                                        // print(scrollController.offset);
                                        scrollPosition
                                            .add(scrollController.offset);
                                      },
                                    );
                                    return StickyHeaderBuilder(
                                      overlapHeaders: false,
                                      builder: (context, stuckAmount) {
                                        print(list[index].toString());
                                        // string.add(list[index].toString());
                                        return Container(
                                          padding: EdgeInsets.all(5),
                                          // height: 20,
                                          color: Colors.white,
                                          child: Column(
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    list[index].toString(),
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                      content: ListView(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 20,
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
                                StreamBuilder<double>(
                                  initialData: 0.0,
                                  stream: scrollPosition.stream,
                                  builder: (context, snapshot) {
                                    return Container(
                                      padding: EdgeInsets.all(5),
                                      height: 26,
                                      // height: 20,
                                      margin: EdgeInsets.only(
                                        top: 2,
                                        left: 10,
                                        right: 10,
                                      ),
                                      color: snapshot.data == 0.0
                                          ? Colors.transparent
                                          : Color.fromARGB(17, 65, 33, 243),
                                      // child: Text(snapshot.data.toString()),
                                    );
                                  },
                                ),
                              ],
                            ),
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
    );
  }
}
