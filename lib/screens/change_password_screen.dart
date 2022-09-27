import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/box_styles.dart';
import '../utils/color.dart';
import '../widgets/text_form_field_container.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool _isValidPassword = true;
  bool _isValidNewPassword = true;
  bool _isValidConfirmNewPassword = true;

  bool _passwordVisible = false;
  bool _newPasswordVisible = false;
  bool _confirmNewPasswordVisible = false;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();
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
                  'Change Password',
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
            height: 20,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12.0),
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    TextFormFieldContainer(
                      textForm: TextFormField(
                        obscureText: !_passwordVisible,
                        controller: passwordController,
                        autovalidateMode: AutovalidateMode.always,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            setState(() {
                              _isValidPassword = true;
                            });
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'Old Password',
                          labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 111, 111, 112),
                            fontSize: 14,
                          ),
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                        ),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.deny(
                            RegExp(r'\s'),
                          ),
                        ],
                        cursorHeight: 25,
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    _isValidPassword == false
                        ? const SizedBox(
                            width: double.infinity * 0.7,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 3,
                              ),
                              child: Text(
                                'Please enter valid password',
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
                      height: 15,
                    ),
                    TextFormFieldContainer(
                      textForm: TextFormField(
                        obscureText: !_newPasswordVisible,
                        controller: newPasswordController,
                        autovalidateMode: AutovalidateMode.always,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            setState(() {
                              _isValidNewPassword = true;
                            });
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'New Password',
                          labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 111, 111, 112),
                            fontSize: 14,
                          ),
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              _newPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable
                              setState(() {
                                _newPasswordVisible = !_newPasswordVisible;
                              });
                            },
                          ),
                        ),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.deny(
                            RegExp(r'\s'),
                          ),
                        ],
                        cursorHeight: 25,
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    _isValidNewPassword == false
                        ? const SizedBox(
                            width: double.infinity * 0.7,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 3,
                              ),
                              child: Text(
                                'Please enter valid password',
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
                      height: 15,
                    ),
                    TextFormFieldContainer(
                      textForm: TextFormField(
                        obscureText: !_confirmNewPasswordVisible,
                        controller: confirmNewPasswordController,
                        autovalidateMode: AutovalidateMode.always,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            setState(() {
                              _isValidConfirmNewPassword = true;
                            });
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'Confirm New Password',
                          labelStyle: const TextStyle(
                            color: Color.fromARGB(255, 111, 111, 112),
                            fontSize: 14,
                          ),
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              _confirmNewPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable
                              setState(() {
                                _confirmNewPasswordVisible =
                                    !_confirmNewPasswordVisible;
                              });
                            },
                          ),
                        ),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.deny(
                            RegExp(r'\s'),
                          ),
                        ],
                        cursorHeight: 25,
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    _isValidConfirmNewPassword == false
                        ? const SizedBox(
                            width: double.infinity * 0.7,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 3,
                              ),
                              child: Text(
                                'Please enter valid password',
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
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: ColorStyle.colorPrimary,
                padding: const EdgeInsets.all(
                  18.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0),
                ),
              ),
              onPressed: () {
                if (passwordController.text.isEmpty) {
                  setState(() {
                    _isValidPassword = false;
                  });
                  return;
                }
                if (newPasswordController.text.isEmpty) {
                  setState(() {
                    _isValidNewPassword = false;
                  });
                  return;
                }
                if (confirmNewPasswordController.text.isEmpty) {
                  setState(() {
                    _isValidConfirmNewPassword = false;
                  });
                  return;
                }
                if (confirmNewPasswordController.text !=
                    newPasswordController.text) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Passwords do not match!'),
                    ),
                  );
                  return;
                }
              },
              child: const Text(
                'Change Password',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
