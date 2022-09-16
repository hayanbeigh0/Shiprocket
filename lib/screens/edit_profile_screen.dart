import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/text_form_field_container.dart';

class EditProfile extends StatefulWidget {
  EditProfile(this.email, this.companyName, {Key? key}) : super(key: key);
  String email;
  String companyName;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController companyNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  // late CameraController controller;
  final String screenTitleText = 'Profile';
  final ImagePicker _picker = ImagePicker();
  XFile? image = null;
  final Color primaryColor = const Color.fromARGB(255, 59, 9, 241);
  // bool editCompanyInfo = false;
  bool saveEnabled = false;

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
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                // height: double.infinity,
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
                    Column(
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
                            margin: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                TextFormFieldContainer(
                                  textForm: TextFormField(
                                    autovalidateMode: AutovalidateMode.always,
                                    onChanged: (value) {
                                      if (value.isNotEmpty) {
                                        setState(() {
                                          saveEnabled = true;
                                        });
                                      }
                                    },
                                    initialValue: widget.companyName,
                                    textInputAction: TextInputAction.next,
                                    // controller: companyNameController,
                                    onFieldSubmitted: (value) {
                                      widget.companyName = value;
                                    },
                                    decoration: const InputDecoration(
                                      labelText: 'Company Name',
                                      labelStyle: TextStyle(
                                        color:
                                            Color.fromARGB(255, 111, 111, 112),
                                        fontSize: 14,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                    cursorHeight: 25,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.deny(
                                        RegExp(r'\s'),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormFieldContainer(
                                  backgroundColor:
                                      const Color.fromARGB(255, 215, 214, 214),
                                  textForm: TextFormField(
                                    // controller: emailController,
                                    autovalidateMode: AutovalidateMode.always,
                                    onChanged: (value) {
                                      if (value.isNotEmpty) {
                                        setState(() {
                                          // _isValidEmail = true;
                                        });
                                      }
                                    },
                                    onFieldSubmitted: (value) {
                                      widget.email = value;
                                    },
                                    initialValue: widget.email,
                                    textInputAction: TextInputAction.next,
                                    enabled: false,
                                    // controller: emailController,
                                    decoration: const InputDecoration(
                                      labelText: 'Email',
                                      labelStyle: TextStyle(
                                        color:
                                            Color.fromARGB(255, 111, 111, 112),
                                        fontSize: 14,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                    cursorHeight: 25,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.deny(
                                        RegExp(r'\s'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
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
                            margin: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Website',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormFieldContainer(
                                        textForm: TextFormField(
                                          // controller: emailController,
                                          autovalidateMode:
                                              AutovalidateMode.always,
                                          onChanged: (value) {
                                            if (value.isNotEmpty) {
                                              setState(() {
                                                // _isValidEmail = true;
                                                saveEnabled = true;
                                              });
                                            }
                                          },
                                          textInputAction: TextInputAction.next,
                                          decoration: const InputDecoration(
                                            hintText:
                                                'Enter website (ex: http://www.xyz.com)',
                                            hintStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 111, 111, 112),
                                              fontSize: 14,
                                            ),
                                            border: InputBorder.none,
                                          ),
                                          cursorHeight: 25,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter.deny(
                                              RegExp(r'\s'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
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
          Container(
            width: double.infinity,
            color: Colors.white,
            height: 70,
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15.0,
              top: 7,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        primary: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: !saveEnabled
                          ? null
                          : () {
                              Navigator.pop(context, {
                                'companyName':
                                    widget.companyName.toString().trim(),
                                'email': widget.email.toString().trim(),
                              });
                            },
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 16,
                        ),
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
