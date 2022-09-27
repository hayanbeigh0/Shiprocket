import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shiprocket/screens/kyc_screens/kyc_screen3.dart';

import '../../utils/box_styles.dart';
import '../../utils/color.dart';

class KYCScreen2 extends StatefulWidget {
  const KYCScreen2({super.key});

  @override
  State<KYCScreen2> createState() => _KYCScreen2State();
}

class _KYCScreen2State extends State<KYCScreen2> {
  bool photoUploaded = false;

  late CameraController controller;

  final ImagePicker _picker = ImagePicker();

  XFile? image = null;

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
                padding: const EdgeInsets.all(14.0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
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
                              'Step 2/3 - Business Structure',
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
                                width:
                                    MediaQuery.of(context).size.width * 2 / 3,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: ColorStyle.colorPrimary,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: const Color.fromARGB(255, 203, 202, 202),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(16, 0, 0, 0),
                                  blurRadius: 10,
                                  spreadRadius: 1,
                                  offset: Offset(0, 5),
                                )
                              ],
                            ),
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15.0,
                                vertical: 20.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Tap on the window below to take your selfie for photo identification.',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(20.0),
                                    height: 300,
                                    child: image == null
                                        ? DottedBorder(
                                            color: ColorStyle.borderGrey,
                                            strokeWidth: 1.5,
                                            dashPattern: const [6],
                                            radius: const Radius.circular(8.0),
                                            child: SizedBox(
                                              width: double.infinity,
                                              child: Center(
                                                child: Container(
                                                  height: double.infinity,
                                                  margin:
                                                      const EdgeInsets.all(14),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      8.0,
                                                    ),
                                                    color: const Color.fromARGB(
                                                      255,
                                                      220,
                                                      220,
                                                      220,
                                                    ),
                                                  ),
                                                  child: GestureDetector(
                                                    onTap: () async {
                                                      getCameraImage();
                                                    },
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons.upload,
                                                          color: ColorStyle
                                                              .colorPrimary,
                                                        ),
                                                        Text(
                                                          'Upload Image',
                                                          style: TextStyle(
                                                            color: ColorStyle
                                                                .colorPrimary,
                                                            fontWeight:
                                                                FontWeight.w400,
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
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
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Stack(
                      children: [
                        SizedBox(
                          height: 55,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: ColorStyle.colorPrimary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const KYCScreen3(),
                              ));
                            },
                            child: const Text(
                              'Next',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        // photoUploaded == false
                        //     ?
                        // Container(
                        //   decoration: BoxDecoration(
                        //     color: const Color.fromARGB(66, 255, 255, 255),
                        //     borderRadius: BorderRadius.circular(10),
                        //   ),
                        //   height: 55,
                        //   width: double.infinity,
                        // )
                        // : const SizedBox(),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void getCameraImage() async {
    image = await _picker.pickImage(
      source: ImageSource.camera,
    );
    setState(() {
      image = image;
      if (image != null) {
        photoUploaded = true;
      }
    });
  }
}
