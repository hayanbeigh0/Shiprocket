import 'package:flutter/material.dart';
import 'package:shiprocket/utils/color.dart';

import '../widgets/common_top_bar.dart';

class AboutShiprocket extends StatelessWidget {
  const AboutShiprocket({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CommonTopBar(title: 'About Us'),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12.0),
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
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 3,
                            spreadRadius: 2,
                            color: Color.fromARGB(255, 228, 228, 228),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: double.infinity,
                            alignment: Alignment.topCenter,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 70,
                                  child: Image.asset(
                                    'assets/shiprocket-logo-white.png',
                                  ),
                                ),
                                const Text(
                                  'Shiprocket',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(190, 0, 0, 0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: const [
                              Text(
                                'About us -',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(190, 0, 0, 0),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '2.2.6',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromARGB(190, 0, 0, 0),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.all(12.0),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(34, 130, 142, 221),
                            ),
                            child: Column(
                              children: const [
                                Text(
                                  'Shiprocket is a tech-enabled logistics and fulfillment solution provider serving over 1 lakh active Direct to Consumer sellers with its widest pin code reach, lowest rates and best customer service. We help Small and Medium Businesses manage end-to-end post-order operations seamlesslv with our Al-powered post-order services such as smart packaging, Commerce fulfillment and warehousing solution, affordable shipping aggregation, hyperlocal deliveries, and more.',
                                  style: TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'User Agreement & Terms of Service',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: ColorStyle.colorPrimary,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
