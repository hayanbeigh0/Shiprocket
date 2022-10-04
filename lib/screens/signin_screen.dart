import 'package:flutter/material.dart';
import 'package:shiprocket/widgets/signin_form.dart';

import '../widgets/form_container.dart';
import '../widgets/signup_options.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 222, 250, 234),
      body: Stack(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/signin-screen-image.png',
                ),
              ),
            ),
          ),
          const FormContainer(
            topText: 'Sign in Using',
            signupOrLoginWidget: SignupOptions(),
            formWidget: SigninForm(),
          ),
        ],
      ),
    );
  }
}
