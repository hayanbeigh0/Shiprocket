import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shiprocket/widgets/common_screen_theme.dart';
import 'package:shiprocket/widgets/text_form_field_container.dart';

import '../utils/color.dart';

class InvoicePreferences extends StatefulWidget {
  const InvoicePreferences({Key? key}) : super(key: key);

  @override
  State<InvoicePreferences> createState() => _InvoicePreferencesState();
}

class _InvoicePreferencesState extends State<InvoicePreferences> {
  var items = ['Classic A4 Size', 'Return'];

  final ImagePicker _picker = ImagePicker();

  XFile? image = null;
  final Color primaryColor = const Color.fromARGB(255, 59, 9, 241);
  // bool editCompanyInfo = false;
  bool saveEnabled = false;

  Color borderGrey = const Color.fromARGB(57, 0, 0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommonScreenTheme(
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
              backgroundColor: ColorStyle.colorPrimary,
            ),
            child: const Text(
              'Save',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
        // shadowColor: Colors.grey.withOpacity(0.1),
        shadowBlurRadius: 0.8,
        shadowSpreadRadius: 2,
        shadowOffsetInX: 0,
        shadowOffsetInY: 0,
        topBarTitle: 'Invoices',
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Fill in the details below for your Customer Invoices:',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 55,
                  child: TextFormFieldContainer(
                    textForm: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('CIN Number'),
                        border: InputBorder.none,
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 55,
                  child: TextFormFieldContainer(
                    textForm: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Invoice Prefix*'),
                        border: InputBorder.none,
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 55,
                  child: TextFormFieldContainer(
                    textForm: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Invoice Suffix*'),
                        border: InputBorder.none,
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 55,
                  child: SizedBox(
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
                          labelText: 'Invoice Type',
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
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Upload your Signature',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 0,
                  shadowColor: const Color.fromARGB(85, 75, 55, 226),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                  ),
                  child: SizedBox(
                    // padding: const EdgeInsets.all(20.0),
                    height: 125,
                    child: image == null
                        ? DottedBorder(
                            color: borderGrey,
                            strokeWidth: 3.5,
                            dashPattern: const [12],
                            child: SizedBox(
                              width: double.infinity,
                              child: Center(
                                child: GestureDetector(
                                  onTap: () async {
                                    getCameraImage();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.upload,
                                        color: primaryColor,
                                      ),
                                      Text(
                                        'Upload Image',
                                        style: TextStyle(
                                          color: primaryColor,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.file(
                                  File(image!.path),
                                  fit: BoxFit.cover,
                                  width: 100,
                                ),
                                SizedBox(
                                  width: 30,
                                  height: 20,
                                  child: IconButton(
                                    onPressed: () {
                                      getCameraImage();
                                    },
                                    padding: EdgeInsets.zero,
                                    icon: const Icon(
                                      Icons.edit,
                                    ),
                                    iconSize: 20,
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
        ),
      ),
    );
  }

  void getCameraImage() async {
    image = await _picker.pickImage(
      source: ImageSource.camera,
    );
    setState(() {
      image = image;
    });
  }
}
