import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:shiprocket/utils/color.dart';

import '../utils/box_styles.dart';

class ReferAndEarn extends StatelessWidget {
  const ReferAndEarn({super.key});

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
                  'Refer And Earn',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer()
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                gradient: const LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Color.fromARGB(255, 24, 190, 29),
                    Color.fromARGB(255, 24, 190, 29),
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
              child: Container(
                // padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  // color: Colors.white,
                  // border: Border.all(
                  //   color: const Color.fromARGB(255, 212, 210, 210),
                  // ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        children: [
                          Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                  color: Color.fromARGB(61, 158, 158, 158),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            width: double.infinity,
                            child: Image.asset('assets/invite-friends.PNG'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            clipBehavior: Clip.antiAlias,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 242, 243, 251),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                  color: Color.fromARGB(61, 158, 158, 158),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'How it works?',
                                  style: TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  padding: const EdgeInsets.all(10.0),
                                  width: double.infinity,
                                  child: const Text(
                                    '1. Share your referral code to invite your friends to Shiprocket.',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  padding: const EdgeInsets.all(10.0),
                                  width: double.infinity,
                                  child: const Text(
                                    '2. They successfully sign up & recharge on Shiprocket.',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  padding: const EdgeInsets.all(10.0),
                                  width: double.infinity,
                                  child: const Text(
                                    '3. On their successful recharge you both are credited with Rs 200 in vour Shiprocket wallets',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
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
                            height: 12,
                          ),
                          Container(
                            clipBehavior: Clip.antiAlias,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 242, 243, 251),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                  color: Color.fromARGB(61, 158, 158, 158),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Your Referral Code:',
                                  style: TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: DottedBorder(
                                        dashPattern: const [5],
                                        strokeWidth: 2.3,
                                        color: ColorStyle.colorPrimary,
                                        radius: const Radius.circular(10),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 12,
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'REF1a05ch',
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Expanded(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              ColorStyle.colorPrimary,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 11,
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: Row(
                                          children: const [
                                            Icon(
                                              Icons.copy,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Copy Code',
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Container(
                            clipBehavior: Clip.antiAlias,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 242, 243, 251),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                  color: Color.fromARGB(61, 158, 158, 158),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Share Referral Code with friends',
                                  style: TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Wrap(
                                  runSpacing: 20,
                                  spacing: 0,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),
                                          width: 60,
                                          child: MaterialButton(
                                            padding: EdgeInsets.zero,
                                            height: 17,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            shape: const CircleBorder(
                                              side: BorderSide(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            onPressed: () {},
                                            child: CircleAvatar(
                                              radius: 28,
                                              child: Image.asset(
                                                'assets/whatsapp-icon.PNG',
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 9,
                                        ),
                                        const Text(
                                          'Whatsapp',
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),
                                          width: 60,
                                          child: MaterialButton(
                                            padding: EdgeInsets.zero,
                                            height: 20,
                                            shape: const CircleBorder(
                                              side: BorderSide(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            onPressed: () {},
                                            child: CircleAvatar(
                                              radius: 28,
                                              child: Image.asset(
                                                'assets/gmail-icon.PNG',
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 9,
                                        ),
                                        const Text(
                                          'Gmail',
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),
                                          width: 60,
                                          child: MaterialButton(
                                            padding: EdgeInsets.zero,
                                            height: 20,
                                            shape: const CircleBorder(
                                              side: BorderSide(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            onPressed: () {},
                                            child: CircleAvatar(
                                              radius: 28,
                                              child: Image.asset(
                                                'assets/facebook-icon.PNG',
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 9,
                                        ),
                                        const Text(
                                          'Facebook',
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),
                                          width: 60,
                                          child: MaterialButton(
                                            padding: EdgeInsets.zero,
                                            height: 20,
                                            shape: const CircleBorder(
                                              side: BorderSide(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            onPressed: () {},
                                            child: CircleAvatar(
                                              radius: 28,
                                              child: Image.asset(
                                                'assets/message-icon.PNG',
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 9,
                                        ),
                                        const Text(
                                          'Message',
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),
                                          width: 60,
                                          child: MaterialButton(
                                            padding: EdgeInsets.zero,
                                            height: 20,
                                            shape: const CircleBorder(
                                              side: BorderSide(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            onPressed: () {},
                                            child: CircleAvatar(
                                              radius: 28,
                                              child: Image.asset(
                                                'assets/linkedin-icon.PNG',
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 9,
                                        ),
                                        const Text(
                                          'Linkedin',
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),
                                          width: 60,
                                          child: MaterialButton(
                                            padding: EdgeInsets.zero,
                                            height: 20,
                                            shape: const CircleBorder(
                                              side: BorderSide(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            onPressed: () {},
                                            child: CircleAvatar(
                                              radius: 28,
                                              child: Image.asset(
                                                'assets/twitter-icon.PNG',
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 9,
                                        ),
                                        const Text(
                                          'Twitter',
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),
                                          width: 60,
                                          child: MaterialButton(
                                            padding: EdgeInsets.zero,
                                            height: 20,
                                            shape: const CircleBorder(
                                              side: BorderSide(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            onPressed: () {},
                                            child: CircleAvatar(
                                              radius: 28,
                                              child: Image.asset(
                                                'assets/share-icon.PNG',
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 9,
                                        ),
                                        const Text(
                                          'Other',
                                          style: TextStyle(
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Terms & Conditions',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
