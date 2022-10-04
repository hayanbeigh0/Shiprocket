import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shiprocket/models/address_list.dart';
import 'package:shiprocket/models/pincode_to_address.dart';
import 'package:shiprocket/provider/added_customer.dart';

import '../models/added_customer.dart';
import '../utils/color.dart';
import '../widgets/text_form_field_container.dart';
import 'package:http/http.dart' as http;

class AddCustomer extends StatefulWidget {
  const AddCustomer({Key? key}) : super(key: key);

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  @override
  void initState() {
    countryController.text = '';
    stateController.text = '';
    cityController.text = '';
    super.initState();
  }

  bool _isValidFirstName = true;

  bool _isValidLastName = true;

  bool _isValidEmail = true;
  bool _isValidPhoneNumber = true;
  bool _isValidAlternatePhoneNumber = true;
  bool _isValidHouseNumber = true;
  bool _isValidStreetName = true;
  bool _isValidLandmark = true;
  bool _isValidPincode = true;
  bool _isValidCity = true;
  bool _isValidState = true;
  bool _isValidCountry = true;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController alternatePhoneNumberController =
      TextEditingController();
  final TextEditingController houseNumberController = TextEditingController();
  final TextEditingController streetNameController = TextEditingController();
  final TextEditingController landmarkController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final customerListProvider = Provider.of<AddedCustomerProvider>(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            decoration: const BoxDecoration(
              color: Color.fromARGB(43, 82, 121, 247),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(70),
                bottomRight: Radius.circular(70),
              ),
            ),
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
                  'Add a New Customer',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer()
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    width: double.infinity,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Customer Details',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: const Color.fromARGB(255, 210, 210, 210),
                            ),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        TextFormFieldContainer(
                                          textForm: TextFormField(
                                            controller: firstNameController,
                                            autovalidateMode:
                                                AutovalidateMode.always,
                                            onChanged: (value) {
                                              if (value.isNotEmpty) {
                                                setState(() {
                                                  _isValidFirstName = true;
                                                });
                                              }
                                            },
                                            inputFormatters: <
                                                TextInputFormatter>[
                                              FilteringTextInputFormatter.deny(
                                                RegExp(r'\s'),
                                              ),
                                            ],
                                            decoration: const InputDecoration(
                                              labelText: 'First Name',
                                              labelStyle: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 111, 111, 112),
                                                fontSize: 14,
                                              ),
                                              border: InputBorder.none,
                                            ),
                                            textInputAction:
                                                TextInputAction.next,
                                            cursorHeight: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                      child: TextFormFieldContainer(
                                    textForm: TextFormField(
                                      controller: lastNameController,
                                      autovalidateMode: AutovalidateMode.always,
                                      onChanged: (value) {
                                        if (value.isNotEmpty) {
                                          setState(() {
                                            _isValidLastName = true;
                                          });
                                        }
                                      },
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.deny(
                                          RegExp(r'\s'),
                                        ),
                                      ],
                                      decoration: const InputDecoration(
                                        labelText: 'Last Name',
                                        labelStyle: TextStyle(
                                          color: Color.fromARGB(
                                              255, 111, 111, 112),
                                          fontSize: 14,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                      cursorHeight: 25,
                                      textInputAction: TextInputAction.next,
                                    ),
                                  )),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    _isValidFirstName == false
                                        ? const Text(
                                            'First name cant be empty',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.red,
                                            ),
                                          )
                                        : const SizedBox(
                                            height: 0,
                                          ),
                                    const Spacer(),
                                    _isValidLastName == false
                                        ? const Text(
                                            'Last name cant be empty',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.red,
                                            ),
                                          )
                                        : const SizedBox(
                                            height: 0,
                                          ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextFormFieldContainer(
                                textForm: TextFormField(
                                  controller: emailController,
                                  autovalidateMode: AutovalidateMode.always,
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      setState(() {
                                        _isValidEmail = true;
                                      });
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    labelText: 'Email',
                                    labelStyle: TextStyle(
                                      color: Color.fromARGB(255, 111, 111, 112),
                                      fontSize: 14,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.deny(
                                      RegExp(r'\s'),
                                    ),
                                  ],
                                  cursorHeight: 25,
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                              _isValidEmail == false
                                  ? const SizedBox(
                                      width: double.infinity * 0.7,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 3,
                                        ),
                                        child: Text(
                                          'Please enter valid email',
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
                                  controller: alternatePhoneNumberController,
                                  autovalidateMode: AutovalidateMode.always,
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      setState(() {
                                        _isValidAlternatePhoneNumber = true;
                                      });
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    labelText:
                                        'Alternate Phone Number (Optional)',
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
                              _isValidAlternatePhoneNumber == false
                                  ? const SizedBox(
                                      width: double.infinity * 0.7,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 3,
                                        ),
                                        child: Text(
                                          'Please enter valid Alternate Phone Number',
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
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Delivery Address',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: const Color.fromARGB(255, 210, 210, 210),
                            ),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormFieldContainer(
                                textForm: TextFormField(
                                  controller: houseNumberController,
                                  autovalidateMode: AutovalidateMode.always,
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      setState(() {
                                        _isValidHouseNumber = true;
                                      });
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    labelText: 'House No.,Building Name, etc',
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
                              _isValidHouseNumber == false
                                  ? const SizedBox(
                                      width: double.infinity * 0.7,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 3,
                                        ),
                                        child: Text(
                                          'Please enter valid House No.,Building Name,',
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
                                  controller: streetNameController,
                                  autovalidateMode: AutovalidateMode.always,
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      setState(() {
                                        _isValidStreetName = true;
                                      });
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    labelText:
                                        'Locality/Street Name (Optional)',
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
                              _isValidStreetName == false
                                  ? const SizedBox(
                                      width: double.infinity * 0.7,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 3,
                                        ),
                                        child: Text(
                                          'Please enter valid Street Name,',
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
                                  controller: landmarkController,
                                  autovalidateMode: AutovalidateMode.always,
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      setState(() {
                                        _isValidLandmark = true;
                                      });
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    labelText: 'Landmark (Optional)',
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
                              _isValidLandmark == false
                                  ? const SizedBox(
                                      width: double.infinity * 0.7,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 3,
                                        ),
                                        child: Text(
                                          'Please enter valid Landmark,',
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
                                  onFieldSubmitted: (value) {
                                    loadAddressData(value);
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
                              TextFormFieldContainer(
                                backgroundColor:
                                    const Color.fromARGB(255, 241, 240, 240),
                                textForm: TextFormField(
                                  readOnly: true,
                                  controller: countryController,
                                  autovalidateMode: AutovalidateMode.always,
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      setState(() {
                                        _isValidCountry = true;
                                      });
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    labelText: 'Country',
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
                              _isValidCountry == false
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
                                height: 5,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorStyle.colorPrimary,
                              padding: const EdgeInsets.all(17.0),
                            ),
                            onPressed: () {
                              if (firstNameController.text.isEmpty) {
                                setState(() {
                                  _isValidFirstName = false;
                                });
                                return;
                              }
                              if (lastNameController.text.isEmpty) {
                                setState(() {
                                  _isValidLastName = false;
                                });
                                return;
                              }
                              if (emailController.text.isEmpty) {
                                setState(() {
                                  _isValidEmail = false;
                                });
                                return;
                              }
                              if (phoneNumberController.text.isEmpty) {
                                setState(() {
                                  _isValidPhoneNumber = false;
                                });
                                return;
                              }
                              if (alternatePhoneNumberController
                                  .text.isNotEmpty) {
                                if (alternatePhoneNumberController
                                        .text.length !=
                                    10) {
                                  setState(() {
                                    _isValidAlternatePhoneNumber = false;
                                  });
                                  return;
                                }
                              }
                              if (houseNumberController.text.isEmpty) {
                                setState(() {
                                  _isValidHouseNumber = false;
                                });
                                return;
                              }
                              if (streetNameController.text.isEmpty) {
                                setState(() {
                                  _isValidStreetName = false;
                                });
                                return;
                              }

                              if (pincodeController.text.length < 6) {
                                setState(() {
                                  _isValidPincode = false;
                                });
                                return;
                              }
                              customerListProvider.addNewCustomer(
                                AddedCustomer(
                                  firstName: firstNameController.text,
                                  lastName: lastNameController.text,
                                  email: emailController.text,
                                  phoneNumber: phoneNumberController.text,
                                  alternateMobileNumber:
                                      alternatePhoneNumberController.text,
                                  houseNumber: houseNumberController.text,
                                  streetName: streetNameController.text,
                                  landmark: landmarkController.text,
                                  pincode: pincodeController.text,
                                  city: cityController.text,
                                  state: stateController.text,
                                  country: countryController.text,
                                  createdAt: DateFormat('dd MMMM yyyy, h:mm a')
                                      .format(DateTime.now())
                                      .toString(),
                                  addressList: [
                                    AddressList(
                                      houseNumber: houseNumberController.text,
                                      streetName: streetNameController.text,
                                      landmark: landmarkController.text,
                                      pincode: pincodeController.text,
                                      city: cityController.text,
                                      state: stateController.text,
                                      country: countryController.text,
                                    ),
                                  ],
                                ),
                              );
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Add Customer',
                              style: TextStyle(
                                fontSize: 16,
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
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void loadAddressData(String pincode) async {
    final response = await http
        .get(Uri.parse('http://www.postalpincode.in/api/pincode/$pincode'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final address = PincodeToAddress.fromJson(jsonDecode(response.body));
      print(address.postOffice![0].state);
      stateController.text = address.postOffice![0].state.toString();
      countryController.text = address.postOffice![0].country.toString();
      cityController.text = address.postOffice![0].division.toString();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load address!');
    }
  }
}
