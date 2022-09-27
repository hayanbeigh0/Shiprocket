import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shiprocket/utils/color.dart';

import '../utils/box_styles.dart';
import '../widgets/text_form_field_container.dart';

class BillingAddress extends StatefulWidget {
  const BillingAddress({Key? key}) : super(key: key);

  @override
  State<BillingAddress> createState() => _BillingAddressState();
}

class _BillingAddressState extends State<BillingAddress> {
  final TextEditingController addressLine1Controller = TextEditingController();
  bool _isValidAddressLine1 = true;
  final TextEditingController addressLine2Controller = TextEditingController();
  bool _isValidAddressLine2 = true;
  bool _isValidPincode = true;
  bool _isValidCity = true;
  bool _isValidState = true;
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  var items = ['Primary'];
  final TextEditingController phoneNumberController = TextEditingController();
  bool _isValidPhoneNumber = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 140,
            decoration: BoxStyles.topBarContainerDecoration,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Color.fromARGB(136, 0, 0, 0),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  'Billing Address',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer()
              ],
            ),
          ),
          Expanded(
            child: Container(
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
              padding: const EdgeInsets.all(12.0),
              child: Container(
                padding: const EdgeInsets.all(
                  14.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color.fromARGB(255, 212, 210, 210),
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Choose from an existing Pickup Address if Billing Address is same.',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
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
                            height: 25,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Expanded(
                                  child: Divider(
                                    color: Colors.grey,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(6.0),
                                  child: Text(
                                    'OR',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 25, 25, 25),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Add New Address',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormFieldContainer(
                            backgroundColor:
                                const Color.fromARGB(255, 255, 255, 255),
                            textForm: TextFormField(
                              controller: phoneNumberController,
                              autovalidateMode: AutovalidateMode.always,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  setState(() {
                                    _isValidPhoneNumber = true;
                                  });
                                }
                              },
                              decoration: const InputDecoration(
                                labelText: 'Phone Number',
                                labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 111, 111, 112),
                                  fontSize: 14,
                                ),
                                border: InputBorder.none,
                              ),
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                  RegExp(r"[0-9]"),
                                ),
                                LengthLimitingTextInputFormatter(10),
                              ],
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                signed: true,
                                decimal: true,
                              ),
                              cursorHeight: 25,
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          _isValidPhoneNumber == false
                              ? const SizedBox(
                                  width: double.infinity * 0.7,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 3,
                                    ),
                                    child: Text(
                                      'Please enter valid Phone Number',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox(
                                  height: 0,
                                ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormFieldContainer(
                            textForm: TextFormField(
                              controller: addressLine1Controller,
                              autovalidateMode: AutovalidateMode.always,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  setState(() {
                                    _isValidAddressLine1 = true;
                                  });
                                }
                              },
                              decoration: const InputDecoration(
                                labelText: 'Address Line 1',
                                labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 111, 111, 112),
                                  fontSize: 14,
                                ),
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.streetAddress,
                              cursorHeight: 25,
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          _isValidAddressLine1 == false
                              ? const SizedBox(
                                  width: double.infinity * 0.7,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 3,
                                    ),
                                    child: Text(
                                      'Please enter valid Address,',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox(
                                  height: 0,
                                ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormFieldContainer(
                            textForm: TextFormField(
                              controller: addressLine2Controller,
                              autovalidateMode: AutovalidateMode.always,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  setState(() {
                                    _isValidAddressLine2 = true;
                                  });
                                }
                              },
                              decoration: const InputDecoration(
                                labelText: 'Address Line 2',
                                labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 111, 111, 112),
                                  fontSize: 14,
                                ),
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.streetAddress,
                              cursorHeight: 25,
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          _isValidAddressLine2 == false
                              ? const SizedBox(
                                  width: double.infinity * 0.7,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 3,
                                    ),
                                    child: Text(
                                      'Please enter valid Address,',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox(
                                  height: 0,
                                ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormFieldContainer(
                            textForm: TextFormField(
                              controller: pincodeController,
                              autovalidateMode: AutovalidateMode.always,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  setState(() {
                                    _isValidPincode = true;
                                  });
                                }
                              },
                              decoration: const InputDecoration(
                                labelText: 'Pincode',
                                labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 111, 111, 112),
                                  fontSize: 14,
                                ),
                                border: InputBorder.none,
                              ),
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                  RegExp(r"[0-9]"),
                                ),
                              ],
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                signed: true,
                                decimal: true,
                              ),
                              cursorHeight: 25,
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          _isValidPincode == false
                              ? const SizedBox(
                                  width: double.infinity * 0.7,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 3,
                                    ),
                                    child: Text(
                                      'Please enter valid Pincode,',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox(
                                  height: 0,
                                ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormFieldContainer(
                            backgroundColor:
                                const Color.fromARGB(255, 241, 240, 240),
                            textForm: TextFormField(
                              readOnly: true,
                              controller: cityController,
                              autovalidateMode: AutovalidateMode.always,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  setState(() {
                                    _isValidCity = true;
                                  });
                                }
                              },
                              decoration: const InputDecoration(
                                labelText: 'City',
                                labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 111, 111, 112),
                                  fontSize: 14,
                                ),
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.streetAddress,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.deny(
                                  RegExp(r'\s'),
                                ),
                              ],
                              cursorHeight: 25,
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          _isValidCity == false
                              ? const SizedBox(
                                  width: double.infinity * 0.7,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 3,
                                    ),
                                    child: Text(
                                      'Please enter valid City,',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox(
                                  height: 0,
                                ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormFieldContainer(
                            backgroundColor:
                                const Color.fromARGB(255, 241, 240, 240),
                            textForm: TextFormField(
                              readOnly: true,
                              controller: stateController,
                              autovalidateMode: AutovalidateMode.always,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  setState(() {
                                    _isValidState = true;
                                  });
                                }
                              },
                              decoration: const InputDecoration(
                                labelText: 'State',
                                labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 111, 111, 112),
                                  fontSize: 14,
                                ),
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.streetAddress,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.deny(
                                  RegExp(r'\s'),
                                ),
                              ],
                              cursorHeight: 25,
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          _isValidState == false
                              ? const SizedBox(
                                  width: double.infinity * 0.7,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 3,
                                    ),
                                    child: Text(
                                      'Please enter valid State,',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox(
                                  height: 0,
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
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 160,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 45.0,
                        vertical: 15,
                      ),
                      backgroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(
                          color: ColorStyle.colorPrimary,
                        ),
                      ),
                    ),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: ColorStyle.colorPrimary,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 160,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 45.0,
                        vertical: 15,
                      ),
                      backgroundColor: ColorStyle.colorPrimary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(
                          color: ColorStyle.colorPrimary,
                        ),
                      ),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
