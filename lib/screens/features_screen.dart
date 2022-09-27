import 'package:flutter/material.dart';
import 'package:shiprocket/widgets/common_screen_theme.dart';

import '../utils/color.dart';

class Features extends StatefulWidget {
  const Features({Key? key}) : super(key: key);

  @override
  State<Features> createState() => _FeaturesState();
}

class _FeaturesState extends State<Features> {
  bool enableSplitShipments = false;
  bool verifyCODOrders = false;
  bool verifyPrepaidOrders = false;
  bool enableNewPODTemplate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommonScreenTheme(
        topBarTitle: 'Features',
        topWidget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  'Shipments',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomWidget: Column(
          children: const [
            SizedBox(
              height: 20,
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      'Enable Split Shipments',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Switch(
                      activeTrackColor:
                          const Color.fromARGB(255, 229, 225, 225),
                      activeColor: ColorStyle.colorPrimary,
                      value: enableSplitShipments,
                      onChanged: (value) {
                        setState(() {
                          enableSplitShipments = !enableSplitShipments;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: const Color.fromARGB(186, 228, 235, 246),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'How does it work?',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Once you enable the \'Split Shipment\' function for your account, you will be able to :',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        '1. Fulfill orders partially based on the SKU\'s availability in your warehouse',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        '2. Provide faster deliveries to your customers by reducing the order processing time.',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        '3. Ship different products from different warehouses.',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Enable Order Verification',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: const Color.fromARGB(186, 228, 235, 246),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Verify COD Orders',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          Switch(
                            activeTrackColor:
                                const Color.fromARGB(255, 229, 225, 225),
                            activeColor: ColorStyle.colorPrimary,
                            value: verifyCODOrders,
                            onChanged: (value) {
                              setState(() {
                                verifyCODOrders = !verifyCODOrders;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Verify Prepaid Orders',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          Switch(
                            activeTrackColor:
                                const Color.fromARGB(255, 229, 225, 225),
                            activeColor: ColorStyle.colorPrimary,
                            value: verifyPrepaidOrders,
                            onChanged: (value) {
                              setState(() {
                                verifyPrepaidOrders = !verifyPrepaidOrders;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'How does it work?',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Once you enable the \'Order Verification\' , you will be able to:',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        '1. Connect with customers directly form panel to verify their details before shipping the order.',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        '2. Verify your COD orders and reduce the chances of returns.',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        '3. Keep a track of verified and unverified orders with their call recordings.',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text(
                      'Enable New POD Template',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Switch(
                      activeTrackColor:
                          const Color.fromARGB(255, 229, 225, 225),
                      activeColor: ColorStyle.colorPrimary,
                      value: enableNewPODTemplate,
                      onChanged: (value) {
                        setState(() {
                          enableNewPODTemplate = !enableNewPODTemplate;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: const Color.fromARGB(186, 228, 235, 246),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'How does it work?',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Turn the toggle on to enable the new POD template for your account. Here\'s why you should give it a try:',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        '1. Get information like order details, delivery and return address on the POD.',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        '2. Receive authentic signature of your buyer.',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
