import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shiprocket/provider/added_customer.dart';

import '../utils/color.dart';
import '../widgets/text_form_field_container.dart';

class CustomerDetail extends StatefulWidget {
  CustomerDetail({required this.index, Key? key}) : super(key: key);
  final int index;

  @override
  State<CustomerDetail> createState() => _CustomerDetailState();
}

class _CustomerDetailState extends State<CustomerDetail> {
  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneNumberController = TextEditingController();
  bool _isValidPhoneNumber = true;

  bool quickRadioSelected = false;

  bool quickShipmentSelected = false;

  bool returnOrderSelected = false;

  bool hyperlocalOrdertSelected = false;

  bool _isValidFirstName = true;

  bool _isValidLastName = true;

  bool _isValidEmail = true;

  @override
  Widget build(BuildContext context) {
    final customerDetail =
        Provider.of<AddedCustomerProvider>(context, listen: true);
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.45,
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Container(
                                // alignment: Alignment.topCenter,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(43, 82, 121, 247),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(70),
                                    bottomRight: Radius.circular(70),
                                  ),
                                ),
                                height: 260,
                                child: SafeArea(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.arrow_back,
                                          size: 30,
                                          color: Color.fromARGB(136, 0, 0, 0),
                                        ),
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Transform.translate(
                                        offset: const Offset(0, 10),
                                        child: const Text(
                                          'Customer Detail',
                                          style: TextStyle(
                                            fontSize: 21,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      const SizedBox(
                                        width: 10,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            top: 140,
                            left: 0,
                            right: 0,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 11.0),
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0.0,
                                    right: 0.0,
                                    top: 0.0,
                                    child: Transform.translate(
                                      offset: const Offset(0, -35),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color.fromARGB(
                                                  255, 199, 197, 197),
                                              blurRadius: 1,
                                              spreadRadius: 1,
                                            )
                                          ],
                                        ),
                                        child: CircleAvatar(
                                          backgroundColor: const Color.fromARGB(
                                              255, 235, 233, 233),
                                          radius: 35,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: 34,
                                            child: Icon(
                                              Icons.person_outline,
                                              color: ColorStyle.colorPrimary,
                                              size: 45,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // elevation: 10,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color.fromARGB(
                                                  44, 158, 158, 158)
                                              .withOpacity(0.8),
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                          offset: const Offset(0,
                                              1), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          height: 45,
                                        ),
                                        Text(
                                          '${customerDetail.addedCustomers[widget.index].firstName} ${customerDetail.addedCustomers[widget.index].lastName}',
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child: Divider(
                                            color: Colors.grey,
                                            height: 5,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            const Icon(
                                              Icons.call_outlined,
                                              color: Color.fromARGB(
                                                  255, 116, 115, 115),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text(
                                              'Phone No:',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Text(
                                                customerDetail
                                                    .addedCustomers[
                                                        widget.index]
                                                    .phoneNumber,
                                                style: TextStyle(
                                                  color:
                                                      ColorStyle.colorPrimary,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          children: [
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            const Icon(
                                              Icons.call_outlined,
                                              color: Color.fromARGB(
                                                  255, 116, 115, 115),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text(
                                              'Alternate Phone No:',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Text(
                                                customerDetail
                                                    .addedCustomers[
                                                        widget.index]
                                                    .alternateMobileNumber,
                                                style: TextStyle(
                                                  color:
                                                      ColorStyle.colorPrimary,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          children: [
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            const Icon(
                                              Icons.email_outlined,
                                              color: Color.fromARGB(
                                                  255, 116, 115, 115),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text(
                                              'Email:',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Text(
                                                customerDetail
                                                    .addedCustomers[
                                                        widget.index]
                                                    .email,
                                                style: TextStyle(
                                                  color:
                                                      ColorStyle.colorPrimary,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    left: 0.0,
                                    right: 0.0,
                                    top: 0.0,
                                    child: Transform.translate(
                                      offset: const Offset(0, -35),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: CircleAvatar(
                                          backgroundColor: const Color.fromARGB(
                                              255, 235, 233, 233),
                                          radius: 35,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: 34,
                                            child: Icon(
                                              Icons.person_outline,
                                              color: ColorStyle.colorPrimary,
                                              size: 45,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    top: 0,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.edit_outlined,
                                        color: ColorStyle.colorPrimary,
                                        size: 22,
                                      ),
                                      onPressed: () {
                                        firstNameController.text =
                                            customerDetail
                                                .addedCustomers[widget.index]
                                                .firstName;
                                        lastNameController.text = customerDetail
                                            .addedCustomers[widget.index]
                                            .lastName;
                                        emailController.text = customerDetail
                                            .addedCustomers[widget.index].email;
                                        phoneNumberController.text =
                                            customerDetail
                                                .addedCustomers[widget.index]
                                                .phoneNumber;
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            insetPadding: EdgeInsets.all(10),
                                            contentPadding: EdgeInsets.all(20),
                                            content: SizedBox(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.person_outline,
                                                        size: 30,
                                                        color: ColorStyle
                                                            .colorPrimary,
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        'Edit Customer Details',
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      SizedBox(
                                                        width: 40,
                                                        child: IconButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          icon: Icon(
                                                            Icons.close,
                                                            size: 26,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  TextFormFieldContainer(
                                                    textForm: TextFormField(
                                                      controller:
                                                          firstNameController,
                                                      autovalidateMode:
                                                          AutovalidateMode
                                                              .always,
                                                      onChanged: (value) {
                                                        if (value.isNotEmpty) {
                                                          setState(() {
                                                            _isValidFirstName =
                                                                true;
                                                          });
                                                        }
                                                      },
                                                      inputFormatters: <
                                                          TextInputFormatter>[
                                                        FilteringTextInputFormatter
                                                            .deny(
                                                          RegExp(r'\s'),
                                                        ),
                                                      ],
                                                      decoration:
                                                          const InputDecoration(
                                                        labelText: 'First Name',
                                                        labelStyle: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              111,
                                                              111,
                                                              112),
                                                          fontSize: 14,
                                                        ),
                                                        border:
                                                            InputBorder.none,
                                                      ),
                                                      textInputAction:
                                                          TextInputAction.next,
                                                      cursorHeight: 25,
                                                    ),
                                                  ),
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
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  TextFormFieldContainer(
                                                    textForm: TextFormField(
                                                      controller:
                                                          lastNameController,
                                                      autovalidateMode:
                                                          AutovalidateMode
                                                              .always,
                                                      onChanged: (value) {
                                                        if (value.isNotEmpty) {
                                                          setState(() {
                                                            _isValidLastName =
                                                                true;
                                                          });
                                                        }
                                                      },
                                                      inputFormatters: <
                                                          TextInputFormatter>[
                                                        FilteringTextInputFormatter
                                                            .deny(
                                                          RegExp(r'\s'),
                                                        ),
                                                      ],
                                                      decoration:
                                                          const InputDecoration(
                                                        labelText: 'Last Name',
                                                        labelStyle: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              111,
                                                              111,
                                                              112),
                                                          fontSize: 14,
                                                        ),
                                                        border:
                                                            InputBorder.none,
                                                      ),
                                                      cursorHeight: 25,
                                                      textInputAction:
                                                          TextInputAction.next,
                                                    ),
                                                  ),
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
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  TextFormFieldContainer(
                                                    textForm: TextFormField(
                                                      controller:
                                                          emailController,
                                                      autovalidateMode:
                                                          AutovalidateMode
                                                              .always,
                                                      onChanged: (value) {
                                                        if (value.isNotEmpty) {
                                                          setState(() {
                                                            _isValidEmail =
                                                                true;
                                                          });
                                                        }
                                                      },
                                                      decoration:
                                                          const InputDecoration(
                                                        labelText: 'Email',
                                                        labelStyle: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              111,
                                                              111,
                                                              112),
                                                          fontSize: 14,
                                                        ),
                                                        border:
                                                            InputBorder.none,
                                                      ),
                                                      inputFormatters: <
                                                          TextInputFormatter>[
                                                        FilteringTextInputFormatter
                                                            .deny(
                                                          RegExp(r'\s'),
                                                        ),
                                                      ],
                                                      cursorHeight: 25,
                                                      textInputAction:
                                                          TextInputAction.next,
                                                    ),
                                                  ),
                                                  _isValidEmail == false
                                                      ? const SizedBox(
                                                          width:
                                                              double.infinity *
                                                                  0.7,
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                              horizontal: 20,
                                                              vertical: 3,
                                                            ),
                                                            child: Text(
                                                              'Please enter valid email',
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                color:
                                                                    Colors.red,
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
                                                        const Color.fromARGB(
                                                            255, 236, 235, 235),
                                                    textForm: TextFormField(
                                                      enabled: false,
                                                      controller:
                                                          phoneNumberController,
                                                      autovalidateMode:
                                                          AutovalidateMode
                                                              .always,
                                                      onChanged: (value) {
                                                        if (value.isNotEmpty) {
                                                          setState(() {
                                                            _isValidPhoneNumber =
                                                                true;
                                                          });
                                                        }
                                                      },
                                                      decoration:
                                                          const InputDecoration(
                                                        labelText:
                                                            'Phone Number',
                                                        labelStyle: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              111,
                                                              111,
                                                              112),
                                                          fontSize: 14,
                                                        ),
                                                        border:
                                                            InputBorder.none,
                                                      ),
                                                      inputFormatters: <
                                                          TextInputFormatter>[
                                                        FilteringTextInputFormatter
                                                            .allow(
                                                          RegExp(r"[0-9]"),
                                                        ),
                                                        LengthLimitingTextInputFormatter(
                                                            10),
                                                      ],
                                                      keyboardType:
                                                          const TextInputType
                                                              .numberWithOptions(
                                                        signed: true,
                                                        decimal: true,
                                                      ),
                                                      cursorHeight: 25,
                                                      textInputAction:
                                                          TextInputAction.next,
                                                    ),
                                                  ),
                                                  _isValidPhoneNumber == false
                                                      ? const SizedBox(
                                                          width:
                                                              double.infinity *
                                                                  0.7,
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                              horizontal: 20,
                                                              vertical: 3,
                                                            ),
                                                            child: Text(
                                                              'Please enter valid Phone Number',
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                color:
                                                                    Colors.red,
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      : const SizedBox(
                                                          height: 0,
                                                        ),
                                                  SizedBox(
                                                    height: 14,
                                                  ),
                                                  SizedBox(
                                                    width: double.infinity,
                                                    child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        padding: EdgeInsets.all(
                                                          13.0,
                                                        ),
                                                        primary: ColorStyle
                                                            .colorPrimary,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      6.0),
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        if (firstNameController
                                                            .text.isEmpty) {
                                                          setState(() {
                                                            _isValidFirstName =
                                                                false;
                                                          });
                                                          return;
                                                        }
                                                        if (lastNameController
                                                            .text.isEmpty) {
                                                          setState(() {
                                                            _isValidLastName =
                                                                false;
                                                          });
                                                          return;
                                                        }
                                                        if (emailController
                                                            .text.isEmpty) {
                                                          setState(() {
                                                            _isValidEmail =
                                                                false;
                                                          });
                                                          return;
                                                        }
                                                        if (phoneNumberController
                                                            .text.isEmpty) {
                                                          setState(() {
                                                            _isValidPhoneNumber =
                                                                false;
                                                          });
                                                          return;
                                                        }
                                                        customerDetail
                                                            .updateData(
                                                          index: widget.index,
                                                          firstName:
                                                              firstNameController
                                                                  .text,
                                                          lastName:
                                                              lastNameController
                                                                  .text,
                                                          email: emailController
                                                              .text,
                                                        );
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text(
                                                        'Save',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
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
                              0.02,
                              0.02,
                              1.0,
                            ],
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Customer Address',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    '+Add New Address',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: ColorStyle.colorPrimary,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Card(
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Text(
                                            'Address 1',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  59, 76, 175, 79),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 15.0,
                                              vertical: 4.0,
                                            ),
                                            child: Text(
                                              'Default Address',
                                              style: TextStyle(
                                                color: ColorStyle.colorPrimary,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                          const Spacer(),
                                          SizedBox(
                                            width: 30,
                                            child: IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.edit_outlined,
                                                color: ColorStyle.colorPrimary,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '${customerDetail.addedCustomers[widget.index].firstName} ${customerDetail.addedCustomers[widget.index].lastName}',
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '${customerDetail.addedCustomers[widget.index].houseNumber}, ${customerDetail.addedCustomers[widget.index].streetName}, ${customerDetail.addedCustomers[widget.index].city}, ${customerDetail.addedCustomers[widget.index].state} - ${customerDetail.addedCustomers[widget.index].pincode}',
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color:
                                              Color.fromARGB(255, 70, 70, 70),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Phone No:  ${customerDetail.addedCustomers[widget.index].phoneNumber}',
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
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
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 10.0,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20.0),
                  primary: ColorStyle.colorPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(
                        builder: (context, setModalState) =>
                            SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height: 40,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.close,
                                      size: 30,
                                    ),
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                  // vertical: 10.0,
                                ),
                                child: Column(
                                  children: [
                                    const Text(
                                      'Please select what kind of order you want to add :',
                                      style: TextStyle(
                                        fontSize: 19,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setModalState(() {
                                          quickShipmentSelected = true;
                                          returnOrderSelected = false;
                                          hyperlocalOrdertSelected = false;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: quickShipmentSelected
                                              ? const Color.fromARGB(
                                                  45, 158, 158, 158)
                                              : Colors.transparent,
                                          borderRadius: BorderRadius.circular(
                                            5,
                                          ),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 25.0,
                                          vertical: 20.0,
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              child: CircleAvatar(
                                                radius: 15,
                                                backgroundColor: Colors.grey,
                                                child: quickShipmentSelected ==
                                                        true
                                                    ? Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(
                                                          5.0,
                                                        ),
                                                        child: CircleAvatar(
                                                          backgroundColor:
                                                              ColorStyle
                                                                  .colorPrimary,
                                                        ),
                                                      )
                                                    : const SizedBox(),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              height: 60,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: const [
                                                  Text(
                                                    'Quick Shipment',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Create a new order to deliver your products',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setModalState(() {
                                          quickShipmentSelected = false;
                                          returnOrderSelected = true;
                                          hyperlocalOrdertSelected = false;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: returnOrderSelected
                                              ? const Color.fromARGB(
                                                  45, 158, 158, 158)
                                              : Colors.transparent,
                                          borderRadius: BorderRadius.circular(
                                            5,
                                          ),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 25.0,
                                          vertical: 20.0,
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              child: CircleAvatar(
                                                radius: 15,
                                                backgroundColor: Colors.grey,
                                                child:
                                                    returnOrderSelected == true
                                                        ? Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(
                                                              5.0,
                                                            ),
                                                            child: CircleAvatar(
                                                              backgroundColor:
                                                                  ColorStyle
                                                                      .colorPrimary,
                                                            ),
                                                          )
                                                        : const SizedBox(),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              height: 60,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: const [
                                                  Text(
                                                    'Return Order',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Create a pickup for your return order',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setModalState(() {
                                          quickShipmentSelected = false;
                                          returnOrderSelected = false;
                                          hyperlocalOrdertSelected = true;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: hyperlocalOrdertSelected
                                              ? const Color.fromARGB(
                                                  45, 158, 158, 158)
                                              : Colors.transparent,
                                          borderRadius: BorderRadius.circular(
                                            5,
                                          ),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 25.0,
                                          vertical: 20.0,
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              child: CircleAvatar(
                                                radius: 15,
                                                backgroundColor: Colors.grey,
                                                child:
                                                    hyperlocalOrdertSelected ==
                                                            true
                                                        ? Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(
                                                              5.0,
                                                            ),
                                                            child: CircleAvatar(
                                                              backgroundColor:
                                                                  ColorStyle
                                                                      .colorPrimary,
                                                            ),
                                                          )
                                                        : const SizedBox(),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: SizedBox(
                                                height: 60,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: const [
                                                    Text(
                                                      'Hyperlocal Order',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Create a local order for a distance upto 50 kms',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 50,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: ColorStyle.colorPrimary,
                                          elevation: 0,
                                        ),
                                        child: const Text(
                                          'Proceed',
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: const Text(
                  'Add Order',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
