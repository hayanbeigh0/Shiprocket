import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScr extends StatefulWidget {
  const IntroScr({Key? key}) : super(key: key);

  @override
  State<IntroScr> createState() => _IntroScrState();
}

class _IntroScrState extends State<IntroScr> {
  Color colorPrimary = const Color.fromARGB(212, 87, 39, 176);
  static const pageDecoration = PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
    // bodyTextStyle: bodyStyle,
    bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    pageColor: Colors.white,
    imagePadding: EdgeInsets.zero,
  );
  List<PageViewModel> listPagesViewModel = [
    PageViewModel(
      title: "Fractional shares",
      body:
          "Instead of having to buy an entire share, invest any amount you want.",
      image: Image.asset(
        'assets/order-processing.jpg',
        fit: BoxFit.cover,
      ),
      decoration: pageDecoration,
    ),
    PageViewModel(
      title: "Learn as you go",
      body:
          "Download the Stockpile app and master the market with our mini-lesson.",
      image: Image.asset(
        'assets/order-processing.jpg',
        fit: BoxFit.cover,
      ),
      decoration: pageDecoration,
    ),
    PageViewModel(
      title: "Kids and teens",
      body:
          "Kids and teens can track their stocks 24/7 and place trades that you approve.",
      image: Image.asset(
        'assets/order-processing.jpg',
        fit: BoxFit.cover,
      ),
      decoration: pageDecoration,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: IntroductionScreen(
              pages: listPagesViewModel,
              onDone: () {
                // When done button is press
              },
              onSkip: () {
                // You can also override onSkip callback
              },
              showBackButton: false,
              showSkipButton: false,
              showNextButton: false,
              showDoneButton: false,
              // skip: const Icon(Icons.skip_next),
              // next: const Icon(Icons.next),

              dotsDecorator: DotsDecorator(
                size: const Size.square(10.0),
                activeSize: const Size(20.0, 10.0),
                activeColor: colorPrimary,
                color: Colors.black26,
                spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              dotsContainerDecorator: const ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}
