import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shiprocket/screens/edit_profile_screen.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({Key? key}) : super(key: key);

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  Map<String, dynamic> userData = {
    'companyName': 'Shiprocket',
    'email': 'shiprocket@gmail.com',
  };
  late Map<String, dynamic> newUserData;
  late CameraController controller;
  final ImagePicker _picker = ImagePicker();
  XFile? image = null;
  final String screenTitleText = 'Profile';
  final Color primaryColor = const Color.fromARGB(255, 59, 9, 241);
  // bool editCompanyInfo = false;

  Color borderGrey = const Color.fromARGB(57, 0, 0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(43, 82, 121, 247),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(70),
                bottomRight: Radius.circular(70),
              ),
            ),
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  screenTitleText,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Website / Company Logo',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(173, 0, 0, 0),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
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
                  Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 5,
                    shadowColor: const Color.fromARGB(85, 75, 55, 226),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        8,
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      height: 125,
                      child: image == null
                          ? DottedBorder(
                              color: borderGrey,
                              strokeWidth: 1.5,
                              dashPattern: const [6],
                              child: SizedBox(
                                width: double.infinity,
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () async {
                                      getCameraImage();
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      'Company Details',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(173, 0, 0, 0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 5,
                    shadowColor: const Color.fromARGB(85, 75, 55, 226),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        8,
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.badge,
                                color: Color(0xFFCD7F32),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'BRONZE',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(203, 0, 0, 0),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            color: Color.fromARGB(169, 0, 0, 0),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: const [
                              SizedBox(
                                width: 120,
                                child: Text(
                                  'Company ID',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Text(
                                ':',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Text(
                                  '2846873',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
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
                                width: 120,
                                child: Text(
                                  'Company Name',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              const Text(
                                ':',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Text(
                                  userData['companyName'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
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
                                width: 120,
                                child: Text(
                                  'Email',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              const Text(
                                ':',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Text(
                                  userData['email'].toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    height: 60,
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        newUserData = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfile(
                              userData['email'].toString(),
                              userData['companyName'].toString(),
                            ),
                          ),
                        ) as Map<String, dynamic>;
                        setState(() {
                          userData = newUserData;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(174, 95, 29, 225),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Edit Company Info',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void showSheetBottom() {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select source',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(
                    199,
                    0,
                    0,
                    0,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                  // children: [],
                  ),
            ],
          ),
        );
      },
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

  @override
  void dispose() {
    // controller.dispose();
    super.dispose();
  }
}
