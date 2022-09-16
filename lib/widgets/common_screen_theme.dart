import 'package:flutter/material.dart';

import 'common_top_bar.dart';

class CommonScreenTheme extends StatelessWidget {
  CommonScreenTheme({
    Key? key,
    required this.topBarTitle,
    required this.child,
    this.bottomWidget = const SizedBox(),
    this.topWidget = const SizedBox(),
    this.shadowBlurRadius = 0,
    this.shadowSpreadRadius = 0,
    this.shadowOffsetInX = 0,
    this.shadowOffsetInY = 0,
    this.shadowColor = Colors.transparent,
  }) : super(key: key);

  final String topBarTitle;
  final Widget child;
  Widget bottomWidget;
  Widget topWidget;
  double shadowSpreadRadius;
  double shadowBlurRadius;
  double shadowOffsetInX;
  double shadowOffsetInY;
  Color shadowColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonTopBar(
          title: topBarTitle,
        ),
        topWidget,
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: shadowColor,
                  spreadRadius: shadowSpreadRadius,
                  blurRadius: shadowBlurRadius,
                  offset: Offset(
                    shadowOffsetInX,
                    shadowOffsetInY,
                  ), // changes position of shadow
                ),
              ],
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
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  child: SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: Container(
                      margin: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: const Color.fromARGB(255, 212, 210, 210),
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: child,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomWidget
      ],
    );
  }
}
