import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/box_styles.dart';
import '../../utils/color.dart';
import '../../widgets/text_form_field_container.dart';

class DocumentVerification extends StatefulWidget {
  const DocumentVerification({super.key});

  @override
  State<DocumentVerification> createState() => _DocumentVerificationState();
}

class _DocumentVerificationState extends State<DocumentVerification> {
  var items = ['Pan Card', 'Aadhar Card', 'Driving License', 'Valid Passport'];

  bool photoFrontUploaded = false;

  bool photoBackUploaded = false;

  late CameraController controller;

  final ImagePicker _picker = ImagePicker();

  XFile? imageFront = null;
  XFile? imageBack = null;

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
                  'KYC',
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
            height: 10,
          ),
          Expanded(
            child: Container(
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
                    0.23,
                    0.23,
                    1.0,
                  ],
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          // color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              color: Colors.transparent,
                              child: const Text(
                                'Step 3/3 - Verify Documents',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        const Color.fromARGB(74, 158, 158, 158),
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  height: 12,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: ColorStyle.colorPrimary,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Upload the 2 documents below to verify your KYC.',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Document 1',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: const EdgeInsets.all(12.0),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6.0),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                    color: Color.fromARGB(88, 158, 158, 158),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Document Type',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
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
                                          labelText: 'Select Document Type',
                                          labelStyle: TextStyle(
                                            color: Color.fromARGB(
                                                255, 111, 111, 112),
                                            fontSize: 14,
                                          ),
                                          border: InputBorder.none,
                                        ),
                                        items: items
                                            .map(
                                              (item) =>
                                                  DropdownMenuItem<String>(
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
                                    height: 20,
                                  ),
                                  const Text(
                                    'Document Images',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          // padding: const EdgeInsets.all(20.0),
                                          child: imageFront == null
                                              ? DottedBorder(
                                                  color: ColorStyle.borderGrey,
                                                  strokeWidth: 1.5,
                                                  dashPattern: const [6],
                                                  radius: const Radius.circular(
                                                      8.0),
                                                  child: SizedBox(
                                                    // width: double.infinity,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.15,
                                                    child: Center(
                                                      child: Container(
                                                        margin: const EdgeInsets
                                                            .all(
                                                          14,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            8.0,
                                                          ),
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                        child: GestureDetector(
                                                          onTap: () async {
                                                            getCameraImage();
                                                          },
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons.image,
                                                                color: ColorStyle
                                                                    .colorPrimary,
                                                              ),
                                                              const SizedBox(
                                                                height: 8,
                                                              ),
                                                              SizedBox(
                                                                width: 100,
                                                                child: Text(
                                                                  'Upload Image Front Side',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style:
                                                                      TextStyle(
                                                                    color: ColorStyle
                                                                        .colorPrimary,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Center(
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Image.file(
                                                        File(imageFront!.path),
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
                                                          padding:
                                                              EdgeInsets.zero,
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
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Expanded(
                                        child: Container(
                                          // padding: const EdgeInsets.all(15.0),
                                          child: imageFront == null
                                              ? DottedBorder(
                                                  color: ColorStyle.borderGrey,
                                                  strokeWidth: 1.5,
                                                  dashPattern: const [6],
                                                  radius: const Radius.circular(
                                                      8.0),
                                                  child: SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.15,
                                                    child: Center(
                                                      child: Container(
                                                        margin: const EdgeInsets
                                                            .all(
                                                          10,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            8.0,
                                                          ),
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                        child: GestureDetector(
                                                          onTap: () async {
                                                            getCameraImage();
                                                          },
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons.image,
                                                                color: ColorStyle
                                                                    .colorPrimary,
                                                              ),
                                                              const SizedBox(
                                                                height: 8,
                                                              ),
                                                              SizedBox(
                                                                width: 100,
                                                                child: Text(
                                                                  'Upload Image Back Side',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style:
                                                                      TextStyle(
                                                                    color: ColorStyle
                                                                        .colorPrimary,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Center(
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Image.file(
                                                        File(imageFront!.path),
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
                                                          padding:
                                                              EdgeInsets.zero,
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
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 15.0,
                                              horizontal: 24.0,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              side: BorderSide(
                                                color: ColorStyle.colorPrimary,
                                              ),
                                            ),
                                          ),
                                          onPressed: () {},
                                          child: Text(
                                            'Submit Document 1',
                                            style: TextStyle(
                                              fontSize: 17.0,
                                              fontWeight: FontWeight.w400,
                                              color: ColorStyle.colorPrimary,
                                            ),
                                          ),
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
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Document 2',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: const EdgeInsets.all(12.0),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6.0),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                    color: Color.fromARGB(88, 158, 158, 158),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Document Type',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
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
                                          labelText: 'Select Document Type',
                                          labelStyle: TextStyle(
                                            color: Color.fromARGB(
                                                255, 111, 111, 112),
                                            fontSize: 14,
                                          ),
                                          border: InputBorder.none,
                                        ),
                                        items: items
                                            .map(
                                              (item) =>
                                                  DropdownMenuItem<String>(
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
                                    height: 20,
                                  ),
                                  const Text(
                                    'Document Images',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          // padding: const EdgeInsets.all(20.0),
                                          child: imageFront == null
                                              ? DottedBorder(
                                                  color: ColorStyle.borderGrey,
                                                  strokeWidth: 1.5,
                                                  dashPattern: const [6],
                                                  radius: const Radius.circular(
                                                      8.0),
                                                  child: SizedBox(
                                                    // width: double.infinity,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.15,
                                                    child: Center(
                                                      child: Container(
                                                        margin: const EdgeInsets
                                                            .all(
                                                          14,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            8.0,
                                                          ),
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                        child: GestureDetector(
                                                          onTap: () async {
                                                            getCameraImage();
                                                          },
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons.image,
                                                                color: ColorStyle
                                                                    .colorPrimary,
                                                              ),
                                                              const SizedBox(
                                                                height: 8,
                                                              ),
                                                              SizedBox(
                                                                width: 100,
                                                                child: Text(
                                                                  'Upload Image Front Side',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style:
                                                                      TextStyle(
                                                                    color: ColorStyle
                                                                        .colorPrimary,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Center(
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Image.file(
                                                        File(imageFront!.path),
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
                                                          padding:
                                                              EdgeInsets.zero,
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
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Expanded(
                                        child: Container(
                                          // padding: const EdgeInsets.all(15.0),
                                          child: imageFront == null
                                              ? DottedBorder(
                                                  color: ColorStyle.borderGrey,
                                                  strokeWidth: 1.5,
                                                  dashPattern: const [6],
                                                  radius: const Radius.circular(
                                                      8.0),
                                                  child: SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.15,
                                                    child: Center(
                                                      child: Container(
                                                        margin: const EdgeInsets
                                                            .all(
                                                          10,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            8.0,
                                                          ),
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                        child: GestureDetector(
                                                          onTap: () async {
                                                            getCameraImage();
                                                          },
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons.image,
                                                                color: ColorStyle
                                                                    .colorPrimary,
                                                              ),
                                                              const SizedBox(
                                                                height: 8,
                                                              ),
                                                              SizedBox(
                                                                width: 100,
                                                                child: Text(
                                                                  'Upload Image Back Side',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style:
                                                                      TextStyle(
                                                                    color: ColorStyle
                                                                        .colorPrimary,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Center(
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Image.file(
                                                        File(imageFront!.path),
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
                                                          padding:
                                                              EdgeInsets.zero,
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
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            disabledBackgroundColor:
                                                const Color.fromARGB(
                                                    255, 235, 234, 234),
                                            disabledForegroundColor:
                                                const Color.fromARGB(
                                                    255, 184, 184, 184),
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 15.0,
                                              horizontal: 24.0,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              side: BorderSide(
                                                color: imageFront == null ||
                                                        imageBack == null
                                                    ? Colors.grey
                                                    : ColorStyle.colorPrimary,
                                              ),
                                            ),
                                          ),
                                          onPressed:
                                              imageFront == null ? null : () {},
                                          child: Text(
                                            'Submit Document 2',
                                            style: TextStyle(
                                              fontSize: 17.0,
                                              fontWeight: FontWeight.w400,
                                              color: imageFront == null
                                                  ? Colors.grey
                                                  : ColorStyle.colorPrimary,
                                            ),
                                          ),
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
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12.0),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6.0),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                    color: Color.fromARGB(88, 158, 158, 158),
                                  ),
                                ],
                              ),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text:
                                      'By clicking "Submit & Verify Documents" you agree to Shiprocket\'s KYC',
                                  style: const TextStyle(
                                    fontSize: 13.5,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: ' Terms & Conditions',
                                      style: TextStyle(
                                        fontSize: 13.5,
                                        color: ColorStyle.colorPrimary,
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
                        height: 20,
                      ),
                      Container(
                        height: 55,
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            disabledForegroundColor: Colors.white,
                            disabledBackgroundColor: Colors.grey,
                            elevation: 0,
                            backgroundColor: ColorStyle.colorPrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: imageFront == null || imageBack == null
                              ? null
                              : () {},
                          child: const Text(
                            'Submit and Verify Documents',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void getCameraImage() async {
    imageFront = await _picker.pickImage(
      source: ImageSource.camera,
    );
    setState(() {
      imageFront = imageFront;
      if (imageFront != null) {
        photoFrontUploaded = true;
      }
    });
  }
}
