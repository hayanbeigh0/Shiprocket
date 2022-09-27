import 'package:flutter/material.dart';
import '/widgets/common_top_bar.dart';

import '../utils/color.dart';

class Features2 extends StatefulWidget {
  const Features2({Key? key}) : super(key: key);

  @override
  State<Features2> createState() => _Features2State();
}

class _Features2State extends State<Features2> {
  bool enableSplitShipments = false;
  bool verifyCODOrders = false;
  bool verifyPrepaidOrders = false;
  bool enableNewPODTemplate = false;
  bool optForPostpaidRemittance = false;
  bool autoSecurePayments = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CommonTopBar(title: 'Features'),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
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
                          0.1,
                          0.1,
                          1.0,
                        ],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: const Color.fromARGB(255, 212, 210, 210),
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
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
                                      activeTrackColor: const Color.fromARGB(
                                          255, 229, 225, 225),
                                      activeColor: ColorStyle.colorPrimary,
                                      value: enableSplitShipments,
                                      onChanged: (value) {
                                        setState(() {
                                          enableSplitShipments =
                                              !enableSplitShipments;
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
                                    color: const Color.fromARGB(
                                        186, 228, 235, 246),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    color: const Color.fromARGB(
                                        186, 228, 235, 246),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                const Color.fromARGB(
                                                    255, 229, 225, 225),
                                            activeColor:
                                                ColorStyle.colorPrimary,
                                            value: verifyCODOrders,
                                            onChanged: (value) {
                                              setState(() {
                                                verifyCODOrders =
                                                    !verifyCODOrders;
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
                                                const Color.fromARGB(
                                                    255, 229, 225, 225),
                                            activeColor:
                                                ColorStyle.colorPrimary,
                                            value: verifyPrepaidOrders,
                                            onChanged: (value) {
                                              setState(() {
                                                verifyPrepaidOrders =
                                                    !verifyPrepaidOrders;
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
                                      activeTrackColor: const Color.fromARGB(
                                          255, 229, 225, 225),
                                      activeColor: ColorStyle.colorPrimary,
                                      value: enableNewPODTemplate,
                                      onChanged: (value) {
                                        setState(() {
                                          enableNewPODTemplate =
                                              !enableNewPODTemplate;
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
                                    color: const Color.fromARGB(
                                        186, 228, 235, 246),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Post Paid Remittance',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                margin: const EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 212, 210, 210),
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
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
                                            'Opt for Postpaid Remittance',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const Spacer(),
                                          Switch(
                                            activeTrackColor:
                                                const Color.fromARGB(
                                                    255, 229, 225, 225),
                                            activeColor:
                                                ColorStyle.colorPrimary,
                                            value: optForPostpaidRemittance,
                                            onChanged: (value) {
                                              setState(() {
                                                optForPostpaidRemittance =
                                                    !optForPostpaidRemittance;
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
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: const Color.fromARGB(
                                              186, 228, 235, 246),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                              'Benefits of using Postpaid Plan:',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              '1. Dynamic Shipping Limit based on your risk profile at Shiprocket.',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              '2. Your shipping limit will change everyday at midnight to provide you with uninterrupted shipping.',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              '3. Faster COD remittance every Monday, Wednesday and Friday ( will not be processed on Bank Holidays ).',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              'Note:-Please contact customer support for deactivating postpaid account.',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
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
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Auto Secure Shipment',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                margin: const EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 212, 210, 210),
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Expanded(
                                            child: Text(
                                              'Auto Secure all Shipments above Rs 5000',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Switch(
                                            activeTrackColor:
                                                const Color.fromARGB(
                                                    255, 229, 225, 225),
                                            activeColor:
                                                ColorStyle.colorPrimary,
                                            value: autoSecurePayments,
                                            onChanged: (value) {
                                              setState(() {
                                                autoSecurePayments =
                                                    !autoSecurePayments;
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
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: const Color.fromARGB(
                                              186, 228, 235, 246),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
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
                                              '1. Turn the toggle to automatically secure all shipments with a value greater that Rs. 5000',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            const Text(
                                              '2. The refund for your lost, damaged or stolen shipments will be credited to your bank account upon activation. (Max liability value - Rs. 25,00,000).',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              'Terms & Conditions',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      ColorStyle.colorPrimary),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
