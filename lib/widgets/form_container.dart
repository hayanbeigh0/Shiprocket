import 'package:flutter/material.dart';

class FormContainer extends StatelessWidget {
  const FormContainer({
    Key? key,
    required this.topText,
    required this.signupOrLoginWidget,
    required this.formWidget,
  }) : super(key: key);

  final String topText;
  final Widget signupOrLoginWidget;
  final Widget formWidget;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 40,
              color: Colors.transparent,
            ),
            Container(
              margin: const EdgeInsets.only(top: 200),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: Text(
                      topText,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  signupOrLoginWidget,
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Expanded(
                          child: Divider(
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            'Or',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  formWidget,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
