import 'package:flutter/material.dart';
import '/models/intro_page.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import '/screens/signin_screen.dart';
import '/screens/signup_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  Color colorPrimary = const Color.fromARGB(195, 87, 39, 176);
  List<IntroPage> listPagesViewModel = [
    IntroPage(
      pageTitle: "Smooth Order Processing",
      pageDescription:
          "Sync, or create your orders in 30 seconds, and process them based on shipping rates, and estimated pick up and delivery time",
      image: Image.asset(
        'assets/order-processing.jpg',
        fit: BoxFit.cover,
      ),
    ),
    IntroPage(
      pageTitle: "Wider Coverage",
      pageDescription:
          "Ship your orders to over 27,000+ pin codes through 20+ couriers at lowest shipping rates",
      image: Image.asset(
        'assets/wider-coverage.jpg',
        fit: BoxFit.cover,
      ),
    ),
    IntroPage(
      pageTitle: "Real Time Notifications",
      pageDescription:
          "Keep your buyers notified with automated real-time shipment notifications",
      image: Image.asset(
        'assets/real-time-notifications.jpg',
        fit: BoxFit.cover,
      ),
    ),
    IntroPage(
      pageTitle: "Business Analytics",
      pageDescription:
          "Monitor important business metrics to measure your shipping performance",
      image: Image.asset(
        'assets/business-analytics.jpg',
        fit: BoxFit.cover,
      ),
    ),
  ];
  int pageIndex = 0;
  final _currentPageNotifier = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                PageView.builder(
                  onPageChanged: (index) {
                    _currentPageNotifier.value = index;
                  },
                  itemCount: listPagesViewModel.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: listPagesViewModel[index].image,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                listPagesViewModel[index].pageTitle,
                                style: const TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                listPagesViewModel[index].pageDescription,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(177, 0, 0, 0),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
                Positioned(
                  left: 0.0,
                  right: 0.0,
                  bottom: 10.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CirclePageIndicator(
                      dotSpacing: 10.0,
                      selectedDotColor: colorPrimary,
                      dotColor: Colors.grey,
                      itemCount: listPagesViewModel.length,
                      currentPageNotifier: _currentPageNotifier,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 170,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(17.0),
                      primary: colorPrimary,
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const SignupScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(17.0),
                      primary: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: colorPrimary,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const SigninScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 16,
                        color: colorPrimary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
