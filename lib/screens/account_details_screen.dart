import 'package:flutter/material.dart';
import 'package:shiprocket/utils/color.dart';

import '../utils/box_styles.dart';

class AccountDetails extends StatelessWidget {
  const AccountDetails({Key? key}) : super(key: key);
  final String firstName = 'Hayan';
  final String lastName = 'Beigh';
  final String mobileNumber = '7051744660';
  final String email = 'hayanbeigh119@gmail.com';
  final String plan = 'Lite';
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
                  'Account Details',
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
          Padding(
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
                    AccountDetailsCardRow(
                      title: 'First Name',
                      value: firstName,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    AccountDetailsCardRow(
                      title: 'Last Name',
                      value: lastName,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    AccountDetailsCardRow(
                      title: 'Mobile',
                      value: mobileNumber,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    AccountDetailsCardRow(
                      title: 'Email',
                      value: email,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Row(
                            children: const [
                              Text(
                                'Plan',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Spacer(),
                              Text(
                                ':',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Text(
                            plan,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Change Plan',
                            style: TextStyle(
                              color: ColorStyle.colorPrimary,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    )
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
              onPressed: () {},
              child: const Text(
                'Edit Account Details',
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

class AccountDetailsCardRow extends StatelessWidget {
  const AccountDetailsCardRow({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.25,
          child: Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              const Text(
                ':',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
