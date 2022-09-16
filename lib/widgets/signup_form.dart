import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shiprocket/screens/signin_screen.dart';
import 'package:shiprocket/screens/welcome_screen.dart';

import '../screens/bottom_navigation.dart';
import './text_form_field_container.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool _isValidPassword = true;
  bool _passwordVisible = false;
  bool _isValidCompany = true;
  bool _isValidFirstName = true;
  bool _isValidLastName = true;
  bool _isValidEmail = true;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Form(
            key: _form,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            TextFormFieldContainer(
                              textForm: TextFormField(
                                controller: firstNameController,
                                autovalidateMode: AutovalidateMode.always,
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    setState(() {
                                      _isValidFirstName = true;
                                    });
                                  }
                                },
                                decoration: const InputDecoration(
                                  labelText: 'First Name',
                                  labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 111, 111, 112),
                                    fontSize: 14,
                                  ),
                                  border: InputBorder.none,
                                ),
                                textInputAction: TextInputAction.next,
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
                          decoration: const InputDecoration(
                            labelText: 'Last Name',
                            labelStyle: TextStyle(
                              color: Color.fromARGB(255, 111, 111, 112),
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
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    height: 10,
                  ),
                  TextFormFieldContainer(
                    textForm: TextFormField(
                      controller: companyController,
                      autovalidateMode: AutovalidateMode.always,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          setState(() {
                            _isValidCompany = true;
                          });
                        }
                      },
                      decoration: const InputDecoration(
                        labelText: 'Company Name',
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 111, 111, 112),
                          fontSize: 14,
                        ),
                        border: InputBorder.none,
                      ),
                      cursorHeight: 25,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  _isValidCompany == false
                      ? const SizedBox(
                          width: double.infinity * 0.7,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 3,
                            ),
                            child: Text(
                              'Please enter company name',
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
                    height: 15,
                  ),
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
                        labelText: 'Password',
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
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              'Password must contain atleast one capital letter, one small letter, one number and a special character -#?!@\$%^&*',
              style: TextStyle(
                fontSize: 13,
                color: _isValidPassword
                    ? const Color.fromARGB(255, 115, 115, 115)
                    : Colors.red,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                text: 'By signing up you agree to our ',
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 72, 71, 71),
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyle(
                      color: Color.fromARGB(255, 33, 44, 243),
                      fontSize: 15,
                    ),
                  ),
                  TextSpan(
                    text: ' &',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  TextSpan(
                    text: ' T&C',
                    style: TextStyle(
                      color: Color.fromARGB(255, 33, 44, 243),
                      fontSize: 15,
                    ),
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 81, 89, 238),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
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
                  if (companyController.text.isEmpty) {
                    setState(() {
                      _isValidCompany = false;
                    });
                    return;
                  }
                  if (emailController.text.isEmpty ||
                      !emailController.text.contains('@')) {
                    setState(() {
                      _isValidEmail = false;
                    });
                    return;
                  }
                  if (passwordController.text.isEmpty) {
                    setState(() {
                      _isValidPassword = false;
                    });
                    return;
                  } else {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const BottomNavigation(),
                      ),
                    );
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Already have an account?',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 115, 114, 114),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const SigninScreen(),
                  ));
                },
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    color: Color.fromARGB(255, 44, 54, 237),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 78),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          const Text(
            'I want to do something else',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 21, 32, 242),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
