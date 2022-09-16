import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'overview_tab.dart';

class CODTab extends StatefulWidget {
  const CODTab({Key? key}) : super(key: key);

  @override
  State<CODTab> createState() => _CODTabState();
}

class _CODTabState extends State<CODTab> {
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
                                      color: Color.fromARGB(27, 7, 227, 14),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'COD Overview',
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
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: const [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        OrderInfoListItem(
                                          orderInfoType: 'COD Shipment Value',
                                          orderInfoDescription:
                                              'Sum of order value of delivered shipments with payment mode COD',
                                          isQuantity: false,
                                          descriptionFontSize: 12,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8.0,
                                          ),
                                          child: Divider(
                                            height: 25,
                                            thickness: 0.8,
                                          ),
                                        ),
                                        OrderInfoListItem(
                                          orderInfoType:
                                              'Frieght Charges From COD',
                                          orderInfoDescription:
                                              'Freight charges of all non-cancelled shipments deducted from COD remittance',
                                          isQuantity: false,
                                          descriptionFontSize: 12,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8.0,
                                          ),
                                          child: Divider(
                                            height: 25,
                                            thickness: 0.8,
                                          ),
                                        ),
                                        OrderInfoListItem(
                                          orderInfoType: 'COD Remmited',
                                          orderInfoDescription:
                                              'Sum of COD order value which is already remitted',
                                          isQuantity: false,
                                          descriptionFontSize: 12,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8.0,
                                          ),
                                          child: Divider(
                                            height: 25,
                                            thickness: 0.8,
                                          ),
                                        ),
                                        OrderInfoListItem(
                                          orderInfoType:
                                              'Average Shipping Cost',
                                          orderInfoDescription:
                                              'Sum of Order Value of shipments which delivered 8 or more days ago with Payment mode COD and COD Remittance not done',
                                          isQuantity: false,
                                          descriptionFontSize: 12,
                                        ),
                                        SizedBox(
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
                              child: Container(
                                color: const Color.fromARGB(28, 76, 175, 79),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0,
                                  vertical: 15,
                                ),
                                child: const OrderInfoListItem(
                                  orderInfoType: 'Last COD amount Remitted',
                                  orderInfoDescription:
                                      'Sum of Order Value of delivered shipments with payment mode COD & COD amount not remitted',
                                  isQuantity: false,
                                  descriptionFontSize: 12,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
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
