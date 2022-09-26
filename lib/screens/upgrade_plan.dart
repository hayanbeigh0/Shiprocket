import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:sticky_grouped_list/sticky_grouped_list.dart';
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
  List<String> planCategoryList = [
    'General Features',
    'Shipping Tools & Features',
    'Channels & Inventory Management',
    'Accounting & Reconciliaiton',
  ];
  final elements = [
    {'group': 'General Features', 'item': 'No Minimum Sign Up Period'},
    {'group': 'General Features', 'item': 'Shipping Starts at Rs. 29/500 gms'},
    {'group': 'General Features', 'item': '1 User Account'},
    {'group': 'General Features', 'item': 'Unlimited Orders'},
    {'group': 'General Features', 'item': 'All 15 Courier Integrations'},
    {'group': 'General Features', 'item': 'Surface Logistics Partners'},
    {'group': 'General Features', 'item': 'Sales Channel Integration'},
    {'group': 'General Features', 'item': 'No Access to API'},
    {'group': 'General Features', 'item': 'Chat. Call. Email Support'},
    {'group': 'General Features', 'item': 'Training & Setup Assistance'},
    {'group': 'General Features', 'item': 'No International Shipping'},
    {
      'group': 'Shipping Tools & Features',
      'item': 'CORE - Courier Recommendation Engine'
    },
    {'group': 'Shipping Tools & Features', 'item': 'Live Rate Calculator'},
    {'group': 'Shipping Tools & Features', 'item': 'NDR Management'},
    {'group': 'Shipping Tools & Features', 'item': 'NDRIVR Calling'},
    {
      'group': 'Shipping Tools & Features',
      'item': 'Post Ship - Branded Tracking Page'
    },
    {
      'group': 'Shipping Tools & Features',
      'item': 'Weiaht Discrepancy Management'
    },
    {'group': 'Shipping Tools & Features', 'item': 'No NDR Call Centre'},
    {'group': 'Shipping Tools & Features', 'item': 'Early COD'},
    {'group': 'Shipping Tools & Features', 'item': 'Postpaid'},
    {
      'group': 'Shipping Tools & Features',
      'item': 'Automated Shipment Tracking'
    },
    {
      'group': 'Shipping Tools & Features',
      'item': 'Automated Email/SMS Notification'
    },
    {'group': 'Shipping Tools & Features', 'item': 'Manifest & Labels'},
    {'group': 'Shipping Tools & Features', 'item': 'Customized Packing Slips'},
    {'group': 'Shipping Tools & Features', 'item': 'Reporting & Passbook'},
    {
      'group': 'Channels & Inventory Management',
      'item': 'No Catalog Management'
    },
    {
      'group': 'Channels & Inventory Management',
      'item': 'No Bulk Stock & Catalog Import'
    },
    {
      'group': 'Channels & Inventory Management',
      'item': 'No Multi Channel Price Sync'
    },
    {
      'group': 'Channels & Inventory Management',
      'item': 'No Multi Channel Inventory Sync'
    },
    {'group': 'Channels & Inventory Management', 'item': 'Catalog Sync'},
    {
      'group': 'Channels & Inventory Management',
      'item': 'No Multi Auto Sync Channel Orders'
    },
    {
      'group': 'Accounting & Reconciliaiton',
      'item': 'Real-Time Billing Management'
    },
    {
      'group': 'Accounting & Reconciliaiton',
      'item': 'COD Reconciliation, Reporting & Settlement'
    },
  ];

  final ScrollController scrollController = ScrollController();

  final ScrollController scrollHeaderController = ScrollController();

  final StreamController<double> scrollPosition = StreamController();
  final StreamController<String> string = StreamController();

  final StreamController<double> scrollHeaderPosition =
      StreamController.broadcast();
  GlobalKey itemKey = GlobalKey();
  double offset = 0.0;
  var generalFeatureList = [];
  var shippingToolFeatureList = [];
  var channelsAndInventoryManagementList = [];
  var accountingAndReconciliationList = [];
  @override
  void initState() {
    addToGeneralFeatureList();
    addToShippingToolFeatureList();
    addToChannelAndInventoryManagementList();
    addToAccountingAndReconciliationList();
    super.initState();
  }

  void addToGeneralFeatureList() {
    for (var e in elements) {
      if (e['group'] == 'General Features') {
        print(e['group']);
        generalFeatureList.add(e);
      }
      // print(generalFeatureList.length);
    }
  }

  void addToShippingToolFeatureList() {
    elements.map((e) {
      if (e['group'] == 'Shipping Tools & Features') {
        shippingToolFeatureList.add(e);
      }
    });
  }

  void addToChannelAndInventoryManagementList() {
    elements.map((e) {
      if (e['group'] == 'Channels & Inventory Management') {
        channelsAndInventoryManagementList.add(e);
      }
    });
  }

  void addToAccountingAndReconciliationList() {
    elements.map((e) {
      if (e['group'] == 'Accounting & Reconciliaiton') {
        accountingAndReconciliationList.add(e);
      }
    });
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
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  // ListView.builder(
                                  //   key: itemKey,
                                  //   scrollDirection: Axis.vertical,
                                  //   shrinkWrap: true,
                                  //   padding: const EdgeInsets.symmetric(
                                  //     vertical: 10,
                                  //     horizontal: 15,
                                  //   ),
                                  //   itemCount: planCategoryList.length,
                                  //   controller: scrollController,
                                  //   itemBuilder: (context, index) {
                                  //     scrollController.addListener(
                                  //       () {
                                  //         // print(scrollController.offset);
                                  //         scrollPosition
                                  //             .add(scrollController.offset);
                                  //       },
                                  //     );
                                  // return
                                  GroupedListView<dynamic, String>(
                                    controller: scrollController,
                                    useStickyGroupSeparators: true,
                                    floatingHeader: false,
                                    // groupHeaderBuilder: (element) =>
                                    //     Text(element['group']),
                                    // controller: scrollController,
                                    // floatingHeader: true,
                                    // stickyHeaderBackgroundColor: Colors.blue,
                                    elements: elements,
                                    groupBy: (element) => element['group'],
                                    groupSeparatorBuilder: (value) {
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
                                                  value,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
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
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,

                                    itemBuilder: (context, element) {
                                      // scrollController.addListener(
                                      //   () {
                                      //     // print(scrollController.offset);
                                      //     scrollPosition
                                      //         .add(scrollController.offset);
                                      //   },
                                      // );
                                      return Text(
                                        element['item'],
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      );
                                    },
                                  ),
                                  //   },
                                  // ),
                                  // StreamBuilder<double>(
                                  //   initialData: 0.0,
                                  //   stream: scrollPosition.stream,
                                  //   builder: (context, snapshot) {
                                  //     return Container(
                                  //       padding: EdgeInsets.all(5),
                                  //       height: 26,
                                  //       // height: 20,
                                  //       margin: EdgeInsets.only(
                                  //         top: 2,
                                  //         left: 10,
                                  //         right: 10,
                                  //       ),
                                  //       color: snapshot.data == 0.0
                                  //           ? Colors.transparent
                                  //           : Color.fromARGB(17, 65, 33, 243),
                                  //       // child: Text(snapshot.data.toString()),
                                  //     );
                                  //   },
                                  // ),
                                ],
                              ),
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
