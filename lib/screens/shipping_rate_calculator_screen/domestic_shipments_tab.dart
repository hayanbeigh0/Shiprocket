import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shiprocket/widgets/text_form_field_container.dart';

import '../../widgets/text_field_with_trailing_container.dart';

class DomesticShipmentsTab extends StatefulWidget {
  const DomesticShipmentsTab({Key? key}) : super(key: key);

  @override
  State<DomesticShipmentsTab> createState() => _DomesticShipmentsTabState();
}

enum SingingCharacter { lafayette, jefferson }

class _DomesticShipmentsTabState extends State<DomesticShipmentsTab> {
  var items = ['Forward', 'Return'];

  String? selectedValue;

  double textFieldWithTrailingContainerWidth = double.infinity;
  String textFieldWithTrailingContainerLabelText =
      'Enter the weight of package in Kgs';
  String textFieldTrailingContainerText = 'KG';
  bool cashOnDeliverySelected = false;
  bool prepaidSelected = true;
  Color colorPrimary = const Color.fromARGB(212, 87, 39, 176);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: const Color.fromARGB(41, 0, 0, 0),
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Order Type',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: TextFormFieldContainer(
                              textForm: DropdownButtonFormField(
                                iconSize: 30,
                                icon: Transform.translate(
                                  offset: const Offset(
                                    0,
                                    -15,
                                  ),
                                  child: const Icon(
                                    Icons.keyboard_arrow_down,
                                  ),
                                ),
                                decoration: const InputDecoration(
                                  labelText: 'Select Order Type',
                                  labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 111, 111, 112),
                                    fontSize: 14,
                                  ),
                                  border: InputBorder.none,
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
                                onChanged: (value) {},
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormFieldContainer(
                            textForm: TextFormField(
                              textInputAction: TextInputAction.next,
                              initialValue: '190015',
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp(r"[0-9]"),
                                ),
                              ],
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                signed: true,
                                decimal: true,
                              ),
                              decoration: const InputDecoration(
                                labelText:
                                    'Enter 6 digit pick-up area pin-code',
                                labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 111, 111, 112),
                                  fontSize: 14,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormFieldContainer(
                            textForm: TextFormField(
                              textInputAction: TextInputAction.next,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp(r"[0-9]"),
                                ),
                              ],
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                signed: true,
                                decimal: true,
                              ),
                              decoration: const InputDecoration(
                                labelText:
                                    'Enter 6 digit delivery area pin-code',
                                labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 111, 111, 112),
                                  fontSize: 14,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          const Text(
                            'Approximate Dead Weight',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const TextFieldWithTrailingContainer(
                            textFieldWithTrailingContainerWidth:
                                double.infinity,
                            textFieldWithTrailingContainerLabelText:
                                'Enter the weight of package in Kgs',
                            textFieldTrailingContainerText: 'KG',
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 5.0,
                            ),
                            child: Text(
                              'Note: The minimum chargeable weight is 0.50 kg',
                              style: TextStyle(
                                color: Color.fromARGB(150, 0, 0, 0),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          const Text(
                            'Package Dimensions',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Length',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    TextFieldWithTrailingContainer(
                                      textFieldWithTrailingContainerWidth:
                                          double.infinity,
                                      textFieldWithTrailingContainerLabelText:
                                          'L',
                                      textFieldTrailingContainerText: 'CM',
                                    ),
                                  ],
                                ),
                              ),
                              Transform.translate(
                                offset: const Offset(0, 10),
                                child: const Padding(
                                  padding: EdgeInsets.all(1.0),
                                  child: Text(
                                    'X',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Breadth',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    TextFieldWithTrailingContainer(
                                      textFieldWithTrailingContainerWidth:
                                          double.infinity,
                                      textFieldWithTrailingContainerLabelText:
                                          'B',
                                      textFieldTrailingContainerText: 'CM',
                                    ),
                                  ],
                                ),
                              ),
                              Transform.translate(
                                offset: const Offset(0, 10),
                                child: const Padding(
                                  padding: EdgeInsets.all(1.0),
                                  child: Text(
                                    'X',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Height',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    TextFieldWithTrailingContainer(
                                      textFieldWithTrailingContainerWidth:
                                          double.infinity,
                                      textFieldWithTrailingContainerLabelText:
                                          'H',
                                      textFieldTrailingContainerText: 'CM',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Note : Dimension value should be areater than 0.50 cm',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          Stack(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: const [
                                      Text(
                                        'Volumetric Weight',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        Icons.info,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const TextFieldWithTrailingContainer(
                                    textFieldWithTrailingContainerWidth:
                                        double.infinity,
                                    textFieldWithTrailingContainerLabelText:
                                        'Volumetric weight',
                                    textFieldTrailingContainerText: 'KG',
                                  ),
                                ],
                              ),
                              Container(
                                height: 90,
                                color: const Color.fromARGB(163, 255, 255, 255),
                                width: double.infinity,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    cashOnDeliverySelected = true;
                                    prepaidSelected = false;
                                  });
                                },
                                child: Row(
                                  children: [
                                    SizedBox(
                                      child: CircleAvatar(
                                        radius: 9,
                                        backgroundColor: const Color.fromARGB(
                                            120, 158, 158, 158),
                                        child: cashOnDeliverySelected == true
                                            ? Padding(
                                                padding: const EdgeInsets.all(
                                                  4.0,
                                                ),
                                                child: CircleAvatar(
                                                  backgroundColor: colorPrimary,
                                                ),
                                              )
                                            : const SizedBox(),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    SizedBox(
                                      height: 60,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: const [
                                          Text(
                                            'Cash on delivery',
                                            style: TextStyle(
                                              fontSize: 13.5,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    prepaidSelected = true;
                                    cashOnDeliverySelected = false;
                                  });
                                },
                                child: Row(
                                  children: [
                                    SizedBox(
                                      child: CircleAvatar(
                                        radius: 9,
                                        backgroundColor: const Color.fromARGB(
                                            120, 158, 158, 158),
                                        child: prepaidSelected == true
                                            ? Padding(
                                                padding: const EdgeInsets.all(
                                                  4.0,
                                                ),
                                                child: CircleAvatar(
                                                  backgroundColor: colorPrimary,
                                                ),
                                              )
                                            : const SizedBox(),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    SizedBox(
                                      height: 60,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: const [
                                          Text(
                                            'Prepaid',
                                            style: TextStyle(
                                              fontSize: 13.5,
                                              fontWeight: FontWeight.w400,
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
                          cashOnDeliverySelected
                              ? TextFormFieldContainer(
                                  textForm: TextFormField(
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.done,
                                    decoration: const InputDecoration(
                                      labelText: 'Enter order value',
                                      labelStyle: TextStyle(
                                        color:
                                            Color.fromARGB(255, 111, 111, 112),
                                        fontSize: 14,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            width: double.infinity,
            color: Colors.white,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(17.0),
                backgroundColor: const Color.fromARGB(212, 87, 39, 176),
              ),
              child: const Text('Calculate Shipment Rate'),
            ),
          )
        ],
      ),
    );
  }
}



// DropdownButton2(
//                               hint: Text(
//                                 'Select Order Type',
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   color: Theme.of(context).hintColor,
//                                 ),
//                               ),
//                               // barrierLabel: 'Select Order Type',

// items: items
//     .map(
//       (item) => DropdownMenuItem<String>(
//         value: item,
//         child: Text(
//           item,
//           style: const TextStyle(
//             fontSize: 14,
//           ),
//         ),
//       ),
//     )
//     .toList(),
//                               value: selectedValue,
//                               onChanged: (value) {
//                                 setState(() {
//                                   selectedValue = value as String;
//                                 });
//                               },
//                               buttonDecoration: BoxDecoration(
//                                 border: Border.all(
//                                   width: 1,
//                                   color: const Color.fromARGB(51, 0, 0, 0),
//                                 ),
//                                 borderRadius: BorderRadius.circular(
//                                   5,
//                                 ),
//                               ),
//                               buttonPadding: const EdgeInsets.all(10),
//                               buttonHeight: 55,
//                               buttonWidth: double.infinity,
//                               itemHeight: 40,
//                               underline: const SizedBox(),
//                             ),
