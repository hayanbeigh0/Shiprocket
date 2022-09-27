import 'package:flutter/material.dart';
import 'package:shiprocket/screens/wallet_and_passbook_screen.dart/wallet_passbook_tab.dart';

import '/chart/bar_chart.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '/screens/barcode_scanner.dart';
import '/screens/dashboard_screen/dashboard_screen.dart';
import '/screens/shipping_rate_calculator_screen/shipping_rate_calculator.dart';
import '/utils/color.dart';
import '/widgets/add_order_card.dart';
import '/widgets/quick_recharge.dart';

import '../widgets/active_shipments_card.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

enum OrderType { quickShipment, returnOrder, hyperlocalOrder }

class _WelcomeScreenState extends State<WelcomeScreen> {
  var items = ['Today', 'Yesterday', 'Last 30 days', 'Custom'];
  OrderType? orderType = OrderType.returnOrder;
  String? selectedValue;
  String activeShipmentsCount = 'O';
  String toAddMoney = '₹5000';
  String activeShipmentsStatus = 'In Transit';
  String quickShipmentText = 'Quick Shipment';
  String quickShipmentDescription =
      'Create a new order to deliver your products';
  bool quickRadioSelected = false;
  bool quickShipmentSelected = false;
  bool returnOrderSelected = false;
  bool hyperlocalOrdertSelected = false;
  Color colorPrimary = const Color.fromARGB(206, 75, 33, 243);
  Color colorPrimaryExtraLight = const Color.fromARGB(6, 75, 33, 243);
  Color colorPrimaryLight = const Color.fromARGB(191, 75, 33, 243);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 160,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(60, 26, 112, 1),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35),
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Image.asset(
                          'assets/shiprocketlogo.jpeg',
                          height: 50,
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ),
                        child: GestureDetector(
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const WalletAndPassbookTab(),
                          )),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.wallet,
                                color: Colors.white,
                                size: 30,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '₹0.00',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 23,
                )
              ],
            ),
            Transform.translate(
              offset: const Offset(0, 110),
              child: Container(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.all(10),
                child: Card(
                  elevation: 5,
                  shadowColor: const Color.fromARGB(50, 33, 149, 243),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 5,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          size: 30,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Search for order ID, AWB, phone number',
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 111, 111, 112),
                          fontSize: 14,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Transform.translate(
                  offset: const Offset(0, 0),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 10.0,
                            bottom: 5.0,
                            left: 5,
                          ),
                          child: Text(
                            'Quick Actions',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 71, 70, 70),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 125,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: AddOrderCard(recievedContext: context),
                              ),
                              const Expanded(
                                child: QuickRecharge(),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => Barcode(),
                                    ));
                                  },
                                  child: Card(
                                    elevation: 3,
                                    shadowColor:
                                        const Color.fromARGB(50, 33, 149, 243),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Icon(
                                            Icons.document_scanner_outlined,
                                            size: 40,
                                            color: ColorStyle.colorPrimary,
                                          ),
                                        ),
                                        const Text(
                                          'Bar Code Scanner',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => Navigator.of(context)
                                      .push(MaterialPageRoute(
                                    builder: (context) =>
                                        const ShippingRateCalculator(),
                                  )),
                                  child: Card(
                                    elevation: 3,
                                    shadowColor:
                                        const Color.fromARGB(50, 33, 149, 243),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Icon(
                                            Icons.calculate_outlined,
                                            size: 40,
                                            color: ColorStyle.colorPrimary,
                                          ),
                                        ),
                                        const Text(
                                          'Shipping Rate Calculator',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
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
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 10.0,
                            bottom: 5.0,
                            left: 5,
                          ),
                          child: Text(
                            'Actions Requiered',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 71, 70, 70),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 5,
                          shadowColor: const Color.fromARGB(50, 33, 149, 243),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Card(
                                      elevation: 0,
                                      color: Color.fromARGB(69, 76, 175, 79),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10.0,
                                          horizontal: 12,
                                        ),
                                        child: Text(
                                          '0',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromARGB(255, 61, 61, 61),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 1.0),
                                        child: Text(
                                          'New Orders To Be Processed',
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: const [
                                        Text(
                                          'Ship Now',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Icon(
                                            Icons.keyboard_arrow_right_outlined)
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    const Card(
                                      elevation: 0,
                                      color: Color.fromARGB(69, 108, 115, 241),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10.0,
                                          horizontal: 12,
                                        ),
                                        child: Text(
                                          '0',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromARGB(255, 61, 61, 61),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 1.0),
                                      child: SizedBox(
                                        width: 190,
                                        child: Text(
                                          'Orders With Weight Discrepencies',
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: const [
                                        Text(
                                          'Manage',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Icon(
                                            Icons.keyboard_arrow_right_outlined)
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    const Card(
                                      elevation: 0,
                                      color: Color.fromARGB(42, 108, 115, 241),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10.0,
                                          horizontal: 12,
                                        ),
                                        child: Text(
                                          '0',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromARGB(255, 61, 61, 61),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 1.0),
                                      child: SizedBox(
                                        width: 190,
                                        child: Text(
                                          'Update NDR Instructions',
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: const [
                                        Text(
                                          'Update',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Icon(
                                            Icons.keyboard_arrow_right_outlined)
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    const Card(
                                      elevation: 0,
                                      color: Color.fromARGB(24, 108, 128, 241),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10.0,
                                          horizontal: 12,
                                        ),
                                        child: Text(
                                          '0',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromARGB(255, 61, 61, 61),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 1.0),
                                      child: SizedBox(
                                        width: 190,
                                        child: Text(
                                          'Orders Delayed For Delivery',
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: const [
                                        Text(
                                          'Escalate',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Icon(
                                            Icons.keyboard_arrow_right_outlined)
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(19, 60, 26, 112),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 10.0,
                          bottom: 5.0,
                          left: 5,
                        ),
                        child: Text(
                          'Shipment Metrics',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 71, 70, 70),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        shadowColor: const Color.fromARGB(183, 5, 37, 62),
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
                                          color: Color.fromARGB(128, 0, 0, 0),
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
                                        color: Theme.of(context).hintColor,
                                      ),
                                    ),
                                    items: items
                                        .map(
                                          (item) => DropdownMenuItem<String>(
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
                                        color:
                                            const Color.fromARGB(51, 0, 0, 0),
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        5,
                                      ),
                                    ),
                                    buttonPadding: const EdgeInsets.all(10),
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
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 10.0,
                          bottom: 5.0,
                          left: 5,
                        ),
                        child: Text(
                          'Active Shipment',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 71, 70, 70),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ActiveShipmentsCard(
                            activeShipmentsCount: activeShipmentsCount,
                            activeShipmentsStatus: activeShipmentsStatus,
                          ),
                          ActiveShipmentsCard(
                            activeShipmentsCount: activeShipmentsCount,
                            activeShipmentsStatus: 'RTO',
                          ),
                          ActiveShipmentsCard(
                            activeShipmentsCount: activeShipmentsCount,
                            activeShipmentsStatus: 'Picked Up',
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: const BorderSide(
                                color: Color.fromRGBO(60, 26, 112, 1),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const DashboardScreen(),
                                ),
                              );
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(14.0),
                              child: Text(
                                'View All Metrics',
                                style: TextStyle(
                                  color: Color.fromRGBO(60, 26, 112, 1),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
