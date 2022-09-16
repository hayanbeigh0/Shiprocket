import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../widgets/ndr_funnel_card.dart';
import '../../widgets/ndr_funnel_list_item.dart';
import '../../widgets/pickup_performace_count_list_item.dart';
import '../../widgets/pickup_performance_percent_list_item.dart';

class NDRTab extends StatefulWidget {
  const NDRTab({Key? key}) : super(key: key);

  @override
  State<NDRTab> createState() => _NDRTabState();
}

class _NDRTabState extends State<NDRTab> {
  String? selectedValue;

  String orderInfoType = 'Total Orders';

  String orderInfoDescription = 'All orders made by seller';
  String pickupPerformanceListHeading = 'Pickup within 24 Hours';
  double pickupPerformanceListPercentage = 0.0;
  String pickupPerformanceListDescription =
      '% shipments picked up within 24 hours from pickup scheduled date';

  double gridBorderWidth = 0.05;

  Color borderGrey = const Color.fromARGB(57, 0, 0, 0);

  Color textLightGrey = const Color.fromARGB(186, 0, 0, 0);

  var items = ['Today', 'Yesterday', 'Last 30 days', 'Custom'];

  int setNDRTab = 1;
  int setNDRFunnelTab = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Last Synced at: ${DateTime.now()}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(128, 0, 0, 0),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(5.0),
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
                        0.09,
                        0.09,
                        1.0,
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 9,
                              shadowColor:
                                  const Color.fromARGB(85, 75, 55, 226),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  15,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(43, 227, 84, 7),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'NDR',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        DropdownButton2(
                                          hint: Text(
                                            'Last 30 days',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Theme.of(context).hintColor,
                                            ),
                                          ),
                                          items: items
                                              .map(
                                                (item) =>
                                                    DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                          value: selectedValue,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedValue = value as String;
                                            });
                                          },
                                          buttonDecoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1,
                                              color: const Color.fromARGB(
                                                  51, 0, 0, 0),
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              5,
                                            ),
                                            color: Colors.white,
                                          ),
                                          buttonPadding:
                                              const EdgeInsets.all(10),
                                          buttonHeight: 40,
                                          buttonWidth: 140,
                                          itemHeight: 40,
                                          underline: const SizedBox(),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Center(
                                      child: Container(
                                        width: 190,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: borderGrey,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: IntrinsicHeight(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      setNDRTab = 1;
                                                    });
                                                  },
                                                  child: Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 20.0,
                                                      vertical: 10.0,
                                                    ),
                                                    color: setNDRTab == 1
                                                        ? const Color.fromARGB(
                                                            26, 53, 39, 176)
                                                        : const Color.fromARGB(
                                                            15, 158, 158, 158),
                                                    child:
                                                        const Text('Percent'),
                                                  ),
                                                ),
                                              ),
                                              VerticalDivider(
                                                color: borderGrey,
                                                thickness: 1,
                                                width: 1,
                                              ),
                                              Expanded(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      setNDRTab = 2;
                                                    });
                                                  },
                                                  child: Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 20.0,
                                                      vertical: 10.0,
                                                    ),
                                                    // width: double.infinity,
                                                    color: setNDRTab == 2
                                                        ? const Color.fromARGB(
                                                            26, 53, 39, 176)
                                                        : const Color.fromARGB(
                                                            15, 158, 158, 158),
                                                    child: const Text('Count'),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  setNDRTab == 1
                                      ? Column(
                                          children: [
                                            PickupPerformancePercentListItem(
                                              pickupPerformanceListPercentage:
                                                  pickupPerformanceListPercentage,
                                              pickupPerformanceListHeading:
                                                  'NDR Percentage',
                                              pickupPerformanceListDescription:
                                                  'Number of total NDR raised/total non-cancelled shipments',
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const PickupPerformancePercentListItem(
                                              pickupPerformanceListPercentage:
                                                  0.0,
                                              pickupPerformanceListHeading:
                                                  'RTO Percentage',
                                              pickupPerformanceListDescription:
                                                  'Number of shipments in RTO/total non-cancelled shipments',
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const PickupPerformancePercentListItem(
                                              pickupPerformanceListPercentage:
                                                  0.0,
                                              pickupPerformanceListHeading:
                                                  'NDR Delivered Shipments',
                                              pickupPerformanceListDescription:
                                                  'Number of shipments delivered after being in NDR',
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        )
                                      : Column(
                                          children: [
                                            PickupPerformanceCountListItem(
                                              pickupPerformanceListCount:
                                                  pickupPerformanceListPercentage,
                                              pickupPerformanceListHeading:
                                                  pickupPerformanceListHeading,
                                              pickupPerformanceCountListDescription:
                                                  'Number of shipments picked up within 24 hours from pickup scheduled date',
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const PickupPerformanceCountListItem(
                                              pickupPerformanceListCount: 0.0,
                                              pickupPerformanceListHeading:
                                                  'Pickup within 24-48 Hours',
                                              pickupPerformanceCountListDescription:
                                                  'Number of shipments picked up within 24-48 hours from pickup scheduled date',
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const PickupPerformanceCountListItem(
                                              pickupPerformanceListCount: 0.0,
                                              pickupPerformanceListHeading:
                                                  'Pickup greater than 48 Hours',
                                              pickupPerformanceCountListDescription:
                                                  'Number shipments picked up in greater than 48 hours from pickup scheduled date',
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 9,
                              shadowColor:
                                  const Color.fromARGB(85, 75, 55, 226),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  15,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(43, 227, 84, 7),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'NDR Funnel',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        DropdownButton2(
                                          hint: Text(
                                            'Last 30 days',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Theme.of(context).hintColor,
                                            ),
                                          ),
                                          items: items
                                              .map(
                                                (item) =>
                                                    DropdownMenuItem<String>(
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                          value: selectedValue,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedValue = value as String;
                                            });
                                          },
                                          buttonDecoration: BoxDecoration(
                                            border: Border.all(
                                              width: 1,
                                              color: const Color.fromARGB(
                                                  51, 0, 0, 0),
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              5,
                                            ),
                                            color: Colors.white,
                                          ),
                                          buttonPadding:
                                              const EdgeInsets.all(10),
                                          buttonHeight: 40,
                                          buttonWidth: 140,
                                          itemHeight: 40,
                                          underline: const SizedBox(),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Center(
                                      child: Container(
                                        width: 190,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: borderGrey,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: IntrinsicHeight(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      setNDRFunnelTab = 1;
                                                    });
                                                  },
                                                  child: Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 20.0,
                                                      vertical: 10.0,
                                                    ),
                                                    color: setNDRFunnelTab == 1
                                                        ? const Color.fromARGB(
                                                            26, 53, 39, 176)
                                                        : const Color.fromARGB(
                                                            15, 158, 158, 158),
                                                    child:
                                                        const Text('Percent'),
                                                  ),
                                                ),
                                              ),
                                              VerticalDivider(
                                                color: borderGrey,
                                                thickness: 1,
                                                width: 1,
                                              ),
                                              Expanded(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      setNDRFunnelTab = 2;
                                                    });
                                                  },
                                                  child: Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 20.0,
                                                      vertical: 10.0,
                                                    ),
                                                    // width: double.infinity,
                                                    color: setNDRFunnelTab == 2
                                                        ? const Color.fromARGB(
                                                            26, 53, 39, 176)
                                                        : const Color.fromARGB(
                                                            15, 158, 158, 158),
                                                    child: const Text('Count'),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  setNDRFunnelTab == 1
                                      ? const NDRFunnelCard()
                                      : const NDRFunnelCard(),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10.0),
          color: const Color.fromARGB(212, 215, 216, 246),
          width: double.infinity,
          height: 35,
          child: const Text(
            'Note: For detailed analysis, please check the web panel.',
            style: TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}
