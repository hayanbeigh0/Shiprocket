import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/color.dart';
import '../widgets/common_top_bar.dart';

class FAQ extends StatelessWidget {
  FAQ({super.key});

  VoidCallback onTap = () {};
  String helpAndSupportCategoryText = 'Create New Shipments';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CommonTopBar(title: 'Help & Support'),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Container(
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
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(
                            14.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: const Color.fromARGB(255, 212, 210, 210),
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Categories',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              HelpAndSupportCategory(
                                helpAndSupportCategoryText:
                                    helpAndSupportCategoryText,
                                onTap: onTap,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              HelpAndSupportCategory(
                                helpAndSupportCategoryText:
                                    'Local Order Screen',
                                onTap: onTap,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              HelpAndSupportCategory(
                                helpAndSupportCategoryText:
                                    'Recipient details page in order creation flow',
                                onTap: onTap,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              HelpAndSupportCategory(
                                helpAndSupportCategoryText: 'View Shipments',
                                onTap: onTap,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              HelpAndSupportCategory(
                                helpAndSupportCategoryText:
                                    'View Order Details',
                                onTap: onTap,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              HelpAndSupportCategory(
                                helpAndSupportCategoryText:
                                    'Weight Reconciliation',
                                onTap: onTap,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              HelpAndSupportCategory(
                                helpAndSupportCategoryText:
                                    'COD Reconciliation',
                                onTap: onTap,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              HelpAndSupportCategory(
                                helpAndSupportCategoryText: 'Wallet & Passbook',
                                onTap: onTap,
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(73, 114, 195, 236),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      'If you can\'t find answer to vour query in the above categories, please visit our Help Desk page to browse through our complete section of Help articles.',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      height: 30,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor: Colors.white,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 23,
                                            vertical: 7,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                              color: ColorStyle.colorPrimary,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                          ),
                                        ),
                                        child: Text(
                                          'Go to Helo Section',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: ColorStyle.colorPrimary,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(73, 114, 195, 236),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      'Write to us at support@shiprocket.com. We\'ll be glad to hear from vou and help vou resolve vour aueries.',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Business Hours:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 22.0,
                                      ),
                                      padding: const EdgeInsets.all(
                                        12.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: const [
                                              SizedBox(
                                                width: 80,
                                                child: Text(
                                                  'Call Center',
                                                  style: TextStyle(
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                              ),
                                              Text(':'),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                '7 AM to 12 AM (Mon to Sun)',
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: const [
                                              SizedBox(
                                                width: 80,
                                                child: Text(
                                                  'Chat',
                                                  style: TextStyle(
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                              ),
                                              Text(':'),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                '7 AM to 12 AM (Mon to Sat)',
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: const [
                                              SizedBox(
                                                width: 80,
                                                child: Text(
                                                  'Email',
                                                  style: TextStyle(
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                              ),
                                              Text(':'),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                '7 AM to 12 AM (Mon to Sat)',
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
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
}

class HelpAndSupportCategory extends StatelessWidget {
  const HelpAndSupportCategory({
    Key? key,
    required this.helpAndSupportCategoryText,
    required this.onTap,
  }) : super(key: key);

  final String helpAndSupportCategoryText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(73, 114, 195, 236),
        borderRadius: BorderRadius.circular(5.0),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(helpAndSupportCategoryText),
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: const Icon(
              CupertinoIcons.chevron_right,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
