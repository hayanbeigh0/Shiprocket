import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../chart/bar_chart.dart';

class OverviewTab extends StatefulWidget {
  const OverviewTab({Key? key}) : super(key: key);

  @override
  State<OverviewTab> createState() => _OverviewTabState();
}

class _OverviewTabState extends State<OverviewTab> {
  String? selectedValue;
  String orderInfoType = 'Total Orders';
  String orderInfoDescription = 'All orders made by seller';
  double gridBorderWidth = 0.05;
  Color borderGrey = const Color.fromARGB(57, 0, 0, 0);
  Color textLightGrey = const Color.fromARGB(186, 0, 0, 0);

  var items = ['Today', 'Yesterday', 'Last 30 days', 'Custom'];

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
                      const Text(
                        'Orders',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(173, 0, 0, 0),
                        ),
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
                        0.06,
                        0.06,
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
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(27, 7, 227, 14),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          children: const [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'Today\'s Orders',
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    137, 0, 0, 0),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              'O',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: const [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'Yesterday\'s Orders',
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    137, 0, 0, 0),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              'O',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const SizedBox(),
                                            DropdownButton2(
                                              hint: Text(
                                                'Last 30 days',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Theme.of(context)
                                                      .hintColor,
                                                ),
                                              ),
                                              items: items
                                                  .map(
                                                    (item) => DropdownMenuItem<
                                                        String>(
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
                                                  selectedValue =
                                                      value as String;
                                                });
                                              },
                                              buttonDecoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 1,
                                                  color: const Color.fromARGB(
                                                      51, 0, 0, 0),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  5,
                                                ),
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
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        const Divider(
                                          thickness: 1,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        OrderInfoListItem(
                                          orderInfoType: orderInfoType,
                                          orderInfoDescription:
                                              orderInfoDescription,
                                          isQuantity: true,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8.0,
                                          ),
                                          child: Divider(
                                            height: 25,
                                          ),
                                        ),
                                        const OrderInfoListItem(
                                          orderInfoType: 'Cancelled Orders',
                                          orderInfoDescription:
                                              'Cancelled and cancellation request orders',
                                          isQuantity: true,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8.0,
                                          ),
                                          child: Divider(
                                            height: 25,
                                          ),
                                        ),
                                        const OrderInfoListItem(
                                          orderInfoType:
                                              'Total Freight charges',
                                          orderInfoDescription:
                                              'Total Freight charges of the order',
                                          isQuantity: false,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8.0,
                                          ),
                                          child: Divider(
                                            height: 25,
                                          ),
                                        ),
                                        const OrderInfoListItem(
                                          orderInfoType:
                                              'Average Shipping Cost',
                                          orderInfoDescription:
                                              'Sum of all non-cancelled AWB/total non-cancelled AWB',
                                          isQuantity: false,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                'Revenue',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(173, 0, 0, 0),
                                ),
                              ),
                            ),
                            Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 6,
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
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(35, 255, 174, 0),
                                    ),
                                    child: Column(
                                      children: const [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Lifetime',
                                          style: TextStyle(
                                            color: Color.fromARGB(137, 0, 0, 0),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          '₹O',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: GridView.count(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      crossAxisCount: 2,
                                      shrinkWrap: true,
                                      childAspectRatio: 4.5 / 2,
                                      padding: EdgeInsets.zero,
                                      children: [
                                        GridTile(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border(
                                                right: BorderSide(
                                                  color: borderGrey,
                                                  width: gridBorderWidth,
                                                ),
                                                bottom: BorderSide(
                                                  color: borderGrey,
                                                  width: gridBorderWidth,
                                                ),
                                              ),
                                            ),
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'This week',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: textLightGrey,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  const Text(
                                                    '₹O',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        GridTile(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border(
                                                left: BorderSide(
                                                  color: borderGrey,
                                                  width: gridBorderWidth,
                                                ),
                                                bottom: BorderSide(
                                                  color: borderGrey,
                                                  width: gridBorderWidth,
                                                ),
                                              ),
                                            ),
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'This month',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: textLightGrey,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  const Text(
                                                    '₹O',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        GridTile(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border(
                                                right: BorderSide(
                                                  color: borderGrey,
                                                  width: gridBorderWidth,
                                                ),
                                                top: BorderSide(
                                                  color: borderGrey,
                                                  width: gridBorderWidth,
                                                ),
                                              ),
                                            ),
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'This Quarter',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: textLightGrey,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  const Text(
                                                    '₹O',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        GridTile(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border(
                                                left: BorderSide(
                                                  color: borderGrey,
                                                  width: gridBorderWidth,
                                                ),
                                                top: BorderSide(
                                                  color: borderGrey,
                                                  width: gridBorderWidth,
                                                ),
                                              ),
                                            ),
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'This Year',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: textLightGrey,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  const Text(
                                                    '₹O',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                'Shipments',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(173, 0, 0, 0),
                                ),
                              ),
                            ),
                            Card(
                              elevation: 5,
                              shadowColor:
                                  const Color.fromARGB(85, 75, 55, 226),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Total Shipment',
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    128, 0, 0, 0),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Text(
                                              '0',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
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
                                  const BarsChart(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
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

class OrderInfoListItem extends StatelessWidget {
  const OrderInfoListItem({
    Key? key,
    required this.orderInfoType,
    required this.orderInfoDescription,
    required this.isQuantity,
    this.descriptionFontSize = 14.0,
  }) : super(key: key);

  final String orderInfoType;
  final String orderInfoDescription;
  final bool isQuantity;
  final double? descriptionFontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                orderInfoType,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  orderInfoDescription,
                  style: TextStyle(
                    color: const Color.fromARGB(137, 0, 0, 0),
                    fontSize: descriptionFontSize,
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(
          isQuantity ? 'O' : '₹O',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
      ],
    );
  }
}
