import 'package:flutter/material.dart';
import 'package:shiprocket/widgets/signup_form.dart';

import '../widgets/form_container.dart';
import '../widgets/signup_options.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 222, 250, 234),
      body: Stack(
        children: [
          Container(
            height: 300,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/signin-screen-image.png',
                ),
              ),
            ),
          ),
          const FormContainer(
            topText: 'Sign Up Using',
            signupOrLoginWidget: SignupOptions(),
            formWidget: SignupForm(),
          ),
        ],
      ),
    );
  }
}
