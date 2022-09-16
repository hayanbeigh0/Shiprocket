import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shiprocket/widgets/text_form_field_container.dart';

import '../utils/box_styles.dart';
import '../utils/color.dart';

class BankAccountDetails extends StatefulWidget {
  BankAccountDetails({Key? key}) : super(key: key);

  @override
  State<BankAccountDetails> createState() => _BankAccountDetailsState();
}

class _BankAccountDetailsState extends State<BankAccountDetails> {
  var items = ['Primary'];
  final TextEditingController beneficiaryNumberController =
      TextEditingController();

  bool _isValidBeneficiaryNumber = true;
  final TextEditingController confirmBeneficiaryNumberController =
      TextEditingController();
  final TextEditingController ifscCodeController = TextEditingController();

  bool _isValidConfirmBeneficiaryAccountNumber = true;
  bool _isValidIFSCCode = true;

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
                  'Bank Account Details',
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
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
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
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color.fromARGB(255, 212, 210, 210),
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 0.8,
                                  blurRadius: 2,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'As a verification process, we will make a transaction of Re.1 to your account. Your account gets verified when the amount is credited.',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                SizedBox(
                                  height: 60,
                                  child: TextFormFieldContainer(
                                    backgroundColor:
                                        Color.fromARGB(255, 255, 255, 255),
                                    textForm: TextFormField(
                                      controller: beneficiaryNumberController,
                                      autovalidateMode: AutovalidateMode.always,
                                      onChanged: (value) {
                                        if (value.isNotEmpty) {
                                          setState(() {
                                            _isValidBeneficiaryNumber = true;
                                          });
                                        }
                                      },
                                      decoration: const InputDecoration(
                                        labelText: 'Beneficiary Account Number',
                                        labelStyle: TextStyle(
                                          color: Color.fromARGB(
                                              255, 111, 111, 112),
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
                                ),
                                _isValidBeneficiaryNumber == false
                                    ? const SizedBox(
                                        width: double.infinity * 0.7,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 3,
                                          ),
                                          child: Text(
                                            'Please enter a valid Account Number',
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
                                SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  height: 60,
                                  child: TextFormFieldContainer(
                                    backgroundColor:
                                        Color.fromARGB(255, 255, 255, 255),
                                    textForm: TextFormField(
                                      controller:
                                          confirmBeneficiaryNumberController,
                                      autovalidateMode: AutovalidateMode.always,
                                      onChanged: (value) {
                                        if (value.isNotEmpty) {
                                          setState(() {
                                            _isValidConfirmBeneficiaryAccountNumber =
                                                true;
                                          });
                                        }
                                      },
                                      decoration: const InputDecoration(
                                        labelText:
                                            'Re-enter Beneficiary Account Number',
                                        labelStyle: TextStyle(
                                          color: Color.fromARGB(
                                              255, 111, 111, 112),
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
                                ),
                                _isValidConfirmBeneficiaryAccountNumber == false
                                    ? const SizedBox(
                                        width: double.infinity * 0.7,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 3,
                                          ),
                                          child: Text(
                                            'Please enter a valid Account Number',
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
                                SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  height: 60,
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
                                        labelText: 'Beneficiary Account Type',
                                        labelStyle: TextStyle(
                                          color: Color.fromARGB(
                                              255, 111, 111, 112),
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
                                SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  height: 60,
                                  child: TextFormFieldContainer(
                                    backgroundColor:
                                        Color.fromARGB(255, 255, 255, 255),
                                    textForm: TextFormField(
                                      controller: ifscCodeController,
                                      autovalidateMode: AutovalidateMode.always,
                                      onChanged: (value) {
                                        if (value.isNotEmpty) {
                                          setState(() {
                                            _isValidIFSCCode = true;
                                          });
                                        }
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'IFSC Code',
                                        labelStyle: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 111, 111, 112),
                                          fontSize: 14,
                                        ),
                                        suffix: Text(
                                          'IFSC Look Up',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: ColorStyle.colorPrimary,
                                          ),
                                        ),
                                        border: InputBorder.none,
                                      ),
                                      inputFormatters: <TextInputFormatter>[
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
                                ),
                                _isValidIFSCCode == false
                                    ? const SizedBox(
                                        width: double.infinity * 0.7,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 3,
                                          ),
                                          child: Text(
                                            'Please enter a valid Account Number',
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
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: ColorStyle.colorPrimary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Save',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
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
          ),
        ],
      ),
    );
  }
}
