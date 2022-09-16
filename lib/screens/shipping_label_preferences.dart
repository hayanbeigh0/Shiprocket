import 'package:flutter/material.dart';

import '../utils/color.dart';
import '/my_icons_icons.dart';

import '../widgets/common_screen_theme.dart';

class ShippingLabelPreferences extends StatefulWidget {
  const ShippingLabelPreferences({
    Key? key,
  }) : super(key: key);

  @override
  State<ShippingLabelPreferences> createState() =>
      _ShippingLabelPreferencesState();
}

class _ShippingLabelPreferencesState extends State<ShippingLabelPreferences> {
  bool standardDesktopPrinterSelected = false;
  bool standardThermalLabelPrinterSelected = false;
  bool thermalLabelPrinterSelected = false;
  bool displayOrderValueInCODAndPrepaidLabel = false;
  bool displayShipperMobileLabel = false;
  bool displayShipperAddressLabel = false;
  bool hideProductNameLabel = false;
  bool displaySupportNumberAndEmailLabel = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommonScreenTheme(
        topBarTitle: 'Labels',
        bottomWidget: Container(
          height: 90,
          width: double.infinity,
          color: const Color.fromARGB(119, 215, 216, 246),
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 16,
          ),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: ColorStyle.colorPrimary,
            ),
            child: const Text(
              'Save',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(13.0),
                child: Column(
                  children: [
                    const Text(
                      'Please Select below the shipping Label Format best suited for your business:',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                standardDesktopPrinterSelected = true;
                                thermalLabelPrinterSelected = false;
                                standardThermalLabelPrinterSelected = false;
                              });
                            },
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 9,
                                  backgroundColor:
                                      const Color.fromARGB(120, 158, 158, 158),
                                  child: standardDesktopPrinterSelected == true
                                      ? Padding(
                                          padding: const EdgeInsets.all(
                                            4.0,
                                          ),
                                          child: CircleAvatar(
                                            backgroundColor:
                                                ColorStyle.colorPrimary,
                                          ),
                                        )
                                      : const SizedBox(),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  '4.5" x 6.25"',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Expanded(
                                  child: Text(
                                    '(Suitable for standard Desktop Printer)',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 106, 106, 106),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                standardDesktopPrinterSelected = false;
                                standardThermalLabelPrinterSelected = true;
                                thermalLabelPrinterSelected = false;
                              });
                            },
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 9,
                                  backgroundColor:
                                      const Color.fromARGB(120, 158, 158, 158),
                                  child: standardThermalLabelPrinterSelected ==
                                          true
                                      ? Padding(
                                          padding: const EdgeInsets.all(
                                            4.0,
                                          ),
                                          child: CircleAvatar(
                                            backgroundColor:
                                                ColorStyle.colorPrimary,
                                          ),
                                        )
                                      : const SizedBox(),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  '4.5" x 6.25"',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Expanded(
                                  child: Text(
                                    '(Suitable for standard Thermal Label Printer)',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 106, 106, 106),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                standardDesktopPrinterSelected = false;
                                standardThermalLabelPrinterSelected = false;
                                thermalLabelPrinterSelected = true;
                              });
                            },
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 9,
                                  backgroundColor:
                                      const Color.fromARGB(120, 158, 158, 158),
                                  child: thermalLabelPrinterSelected == true
                                      ? Padding(
                                          padding: const EdgeInsets.all(
                                            4.0,
                                          ),
                                          child: CircleAvatar(
                                            backgroundColor:
                                                ColorStyle.colorPrimary,
                                          ),
                                        )
                                      : const SizedBox(),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  '4.5" x 6.25"',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Expanded(
                                  child: Text(
                                    '(Suitable for Thermal Label Printer with all product & price details.)',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 106, 106, 106),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text.rich(
                            TextSpan(
                              text: '',
                              style: TextStyle(
                                // fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Note:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      ' The 4x 6 label will be set for all courier partners except Bluedart.',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          const Divider(
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  children: const [
                                    Text(
                                      'Display Order value in COD and Prepaid label',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        text: '',
                                        style: TextStyle(
                                          // fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Note:',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                ' For couriers Fedex, Bluedart, Delivery, Wow, DotZot, Professional, Gati and Shadowfax Order value for COD shipments will be displayed even if this setting is disabled.',
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Checkbox(
                                activeColor: ColorStyle.colorPrimary,
                                side: const BorderSide(
                                  color: Colors.grey,
                                ),
                                value: displayOrderValueInCODAndPrepaidLabel,
                                onChanged: (newValue) {
                                  setState(() {
                                    displayOrderValueInCODAndPrepaidLabel =
                                        !displayOrderValueInCODAndPrepaidLabel;
                                  });
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Display Shipper\'s Mobile No. in Label',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        text: '',
                                        style: TextStyle(
                                          // fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Note:',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                ' For couriers Fedex, Ekart and Bluedart Shipper\'s Mobile No. will be displayed even if this setting is disabled.',
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Checkbox(
                                activeColor: ColorStyle.colorPrimary,
                                side: const BorderSide(
                                  color: Colors.grey,
                                ),
                                value: displayShipperMobileLabel,
                                onChanged: (newValue) {
                                  setState(() {
                                    displayShipperMobileLabel =
                                        !displayShipperMobileLabel;
                                  });
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Display Shipper\'s Address in Label',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        text: '',
                                        style: TextStyle(
                                          // fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Note:',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                ' For couriers Fedex, Ekart and Bluedart Shipper\'s Address will be displayed even if this setting is disabled.',
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Checkbox(
                                activeColor: ColorStyle.colorPrimary,
                                side: const BorderSide(
                                  color: Colors.grey,
                                ),
                                value: displayShipperAddressLabel,
                                onChanged: (newValue) {
                                  setState(() {
                                    displayShipperAddressLabel =
                                        !displayShipperAddressLabel;
                                  });
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Hide Product Name in Label',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        text: '',
                                        style: TextStyle(
                                          // fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Note:',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                ' This setting will only be applicable for XpressBees, Ekart, Delhivery, Bluedart, and Ecom Express shipping labels.',
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Checkbox(
                                activeColor: ColorStyle.colorPrimary,
                                side: const BorderSide(
                                  color: Colors.grey,
                                ),
                                value: hideProductNameLabel,
                                onChanged: (newValue) {
                                  setState(() {
                                    hideProductNameLabel =
                                        !hideProductNameLabel;
                                  });
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Display Your Support Number & Email in Label',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        text: '',
                                        style: const TextStyle(
                                          // fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                        children: <TextSpan>[
                                          const TextSpan(
                                            text: 'Note:',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                            ),
                                          ),
                                          const TextSpan(
                                            text:
                                                ' This setting will apply to all couriers except FedEx and Ekart. To view your support number and email address on your shipping labels please update your contact details by',
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                          TextSpan(
                                            text: ' clicking here.',
                                            style: TextStyle(
                                              color: ColorStyle.colorPrimary,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Checkbox(
                                activeColor: ColorStyle.colorPrimary,
                                side: const BorderSide(
                                  color: Colors.grey,
                                ),
                                value: displaySupportNumberAndEmailLabel,
                                onChanged: (newValue) {
                                  setState(() {
                                    displaySupportNumberAndEmailLabel =
                                        !displaySupportNumberAndEmailLabel;
                                  });
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              MyIcons.manifests,
                              color: ColorStyle.colorPrimary,
                            ),
                            label: Text(
                              'PREVIEW LABEL',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: ColorStyle.colorPrimary,
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
    );
  }
}


// SizedBox(
//                 height: 10,
//               ),
//               SizedBox(
//                 width: double.infinity,
//                 height: 50,
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     primary: ColorStyle.colorPrimary,
//                   ),
//                   child: Text(
//                     'Save',
//                     style: TextStyle(
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//               ),