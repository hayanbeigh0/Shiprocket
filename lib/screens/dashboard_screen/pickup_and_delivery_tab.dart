import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../widgets/pickup_performace_count_list_item.dart';
import '../../widgets/pickup_performance_percent_list_item.dart';

class PickupAndDelivery extends StatefulWidget {
  const PickupAndDelivery({Key? key}) : super(key: key);

  @override
  State<PickupAndDelivery> createState() => _PickupAndDeliveryState();
}

class _PickupAndDeliveryState extends State<PickupAndDelivery> {
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

  int setPickupTab = 1;
  int setDeliveryTab = 1;

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
                        'Last Synced at: ${DateFormat('dd MMMM yyyy').format(DateTime.now())}',
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
                        0.15,
                        0.15,
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
                                      color: Color.fromARGB(48, 7, 66, 227),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Pickup Performance',
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
                                                      setPickupTab = 1;
                                                    });
                                                  },
                                                  child: Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 20.0,
                                                      vertical: 10.0,
                                                    ),
                                                    color: setPickupTab == 1
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
                                                      setPickupTab = 2;
                                                    });
                                                  },
                                                  child: Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 20.0,
                                                      vertical: 10.0,
                                                    ),
                                                    // width: double.infinity,
                                                    color: setPickupTab == 2
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
                                  setPickupTab == 1
                                      ? Column(
                                          children: [
                                            PickupPerformancePercentListItem(
                                              pickupPerformanceListPercentage:
                                                  pickupPerformanceListPercentage,
                                              pickupPerformanceListHeading:
                                                  pickupPerformanceListHeading,
                                              pickupPerformanceListDescription:
                                                  pickupPerformanceListDescription,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const PickupPerformancePercentListItem(
                                              pickupPerformanceListPercentage:
                                                  0.0,
                                              pickupPerformanceListHeading:
                                                  'Pickup within 24-48 Hours',
                                              pickupPerformanceListDescription:
                                                  '% shipments picked up within 24-48 hours from pickup scheduled date',
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const PickupPerformancePercentListItem(
                                              pickupPerformanceListPercentage:
                                                  0.0,
                                              pickupPerformanceListHeading:
                                                  'Pickup greater than 48 Hours',
                                              pickupPerformanceListDescription:
                                                  '% shipments picked up in greater than 48 hours from pickup scheduled date',
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
                                      color: Color.fromARGB(43, 227, 205, 7),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Delivery Performance',
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
                                                      setDeliveryTab = 1;
                                                    });
                                                  },
                                                  child: Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 20.0,
                                                      vertical: 10.0,
                                                    ),
                                                    color: setDeliveryTab == 1
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
                                                      setDeliveryTab = 2;
                                                    });
                                                  },
                                                  child: Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 20.0,
                                                      vertical: 10.0,
                                                    ),
                                                    // width: double.infinity,
                                                    color: setDeliveryTab == 2
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
                                  setDeliveryTab == 1
                                      ? Column(
                                          children: [
                                            PickupPerformancePercentListItem(
                                              pickupPerformanceListPercentage:
                                                  pickupPerformanceListPercentage,
                                              pickupPerformanceListHeading:
                                                  'Delivered with SLA',
                                              pickupPerformanceListDescription:
                                                  '% shipments delivered on time/total delivered shipments',
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
                                                  'Delivered with SLA',
                                              pickupPerformanceCountListDescription:
                                                  'Number of shipments delivered on time/total delivered shipments',
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
