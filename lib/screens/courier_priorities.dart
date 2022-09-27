import 'package:flutter/material.dart';
import 'package:shiprocket/my_bus_icons.dart';
import 'package:shiprocket/my_icons_icons.dart';
import 'package:shiprocket/utils/color.dart';

import '../utils/box_styles.dart';

class CourierPriorities extends StatefulWidget {
  const CourierPriorities({Key? key}) : super(key: key);

  @override
  State<CourierPriorities> createState() => _CourierPrioritiesState();
}

class _CourierPrioritiesState extends State<CourierPriorities> {
  bool isRecommendedByShiprocketSelected = false;
  bool isCheapestContainerOptionSelected = false;
  bool isFastestContainerOptionSelected = false;
  bool isBestRatedContainerOptionSelected = false;
  bool isCustomContainerOptionSelected = false;

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
                  'Courier Priority',
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
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Container(
                    width: double.infinity,
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
                          0.18,
                          0.18,
                          1.0,
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Please select your Courier Priority',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text.rich(
                          TextSpan(
                            text:
                                'Courier Priority allows you to choose the right courier partner based on cost, courier performance, and delivery performance. If you want to set your own custom courier priority, please visit ',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    'https://app.shiprocket.in/courierPriority',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isRecommendedByShiprocketSelected = true;
                                });
                              },
                              child: Stack(
                                children: [
                                  CourierPriorityOption(
                                    isContainerSelected:
                                        isRecommendedByShiprocketSelected,
                                    iconData: Icons.badge,
                                    text: 'Recommended by Shiprocket',
                                  ),
                                  isRecommendedByShiprocketSelected
                                      ? Positioned(
                                          bottom: 0,
                                          left: 0,
                                          right: 0,
                                          child: Transform.translate(
                                            offset: const Offset(0, 11.5),
                                            child: Container(
                                              width: double.infinity,
                                              alignment: Alignment.bottomCenter,
                                              child: SizedBox(
                                                width: 22.5,
                                                height: 12.5,
                                                child: Transform.rotate(
                                                  angle: 3.14,
                                                  child: CustomPaint(
                                                    painter: TrianglePainter(
                                                      strokeColor: ColorStyle
                                                          .colorPrimary,
                                                      strokeWidth: 10,
                                                      paintingStyle:
                                                          PaintingStyle.fill,
                                                    ),
                                                    child: const SizedBox(
                                                      height: 20,
                                                      width: 20,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      : const SizedBox(),
                                  Positioned(
                                    right: 0,
                                    top: 0,
                                    child: Transform.translate(
                                      offset: const Offset(10, -10),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 3,
                                        ),
                                        decoration: BoxDecoration(
                                          color:
                                              isRecommendedByShiprocketSelected
                                                  ? Colors.green
                                                  : Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                        ),
                                        child: const Text(
                                          'Most Popular',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  isRecommendedByShiprocketSelected
                                      ? Positioned(
                                          bottom: 0,
                                          left: 0,
                                          right: 0,
                                          child: Transform.translate(
                                            offset: const Offset(0, 10),
                                            child: Container(
                                              width: double.infinity,
                                              alignment: Alignment.bottomCenter,
                                              child: SizedBox(
                                                width: 20,
                                                height: 11,
                                                child: Transform.rotate(
                                                  angle: 3.14,
                                                  child: CustomPaint(
                                                    painter: TrianglePainter(
                                                      strokeColor: Colors.white,
                                                      strokeWidth: 10,
                                                      paintingStyle:
                                                          PaintingStyle.fill,
                                                    ),
                                                    child: const SizedBox(
                                                      height: 20,
                                                      width: 20,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            isRecommendedByShiprocketSelected
                                ? Container(
                                    margin: const EdgeInsets.only(bottom: 15),
                                    padding: const EdgeInsets.all(12.0),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                        color: const Color.fromARGB(
                                            43, 82, 121, 247),
                                      ),
                                      child: Column(
                                        children: [
                                          const Text(
                                            'Why should you use Shiprocket\'s Recommendation?',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              SizedBox(
                                                height: 20,
                                                child: CircleAvatar(
                                                  radius: 2.5,
                                                  backgroundColor: Colors.black,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Expanded(
                                                child: Text(
                                                    'Using advanced analvtics and machine learning, we choose the ideal courier partner for each shipment that meet your business goals while still being cost-effective.'),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              SizedBox(
                                                height: 20,
                                                child: CircleAvatar(
                                                  radius: 2.5,
                                                  backgroundColor: Colors.black,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Expanded(
                                                child: Text(
                                                    'Our recommendation is fullv automated and is based on several factors, including courier ratings, pricing, pickup, RTO, delivery performance, and more.'),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              SizedBox(
                                                height: 20,
                                                child: CircleAvatar(
                                                  radius: 2.5,
                                                  backgroundColor: Colors.black,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Expanded(
                                                child: Text(
                                                    'It\'s absolutelv free, and vou mav modify vour priorities whenever vou want.'),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isBestRatedContainerOptionSelected = false;
                                  isCheapestContainerOptionSelected = true;
                                  isCustomContainerOptionSelected = false;
                                  isRecommendedByShiprocketSelected = false;
                                  isFastestContainerOptionSelected = false;
                                });
                              },
                              child: CourierPriorityOption(
                                isContainerSelected:
                                    isCheapestContainerOptionSelected,
                                text: 'Cheapest',
                                iconData: Icons.arrow_downward,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isBestRatedContainerOptionSelected = false;
                                  isCheapestContainerOptionSelected = false;
                                  isCustomContainerOptionSelected = false;
                                  isRecommendedByShiprocketSelected = false;
                                  isFastestContainerOptionSelected = true;
                                });
                              },
                              child: CourierPriorityOption(
                                isContainerSelected:
                                    isFastestContainerOptionSelected,
                                text: 'Fastest',
                                iconData: MyBus.shippingFast,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isBestRatedContainerOptionSelected = true;
                                  isCheapestContainerOptionSelected = false;
                                  isCustomContainerOptionSelected = false;
                                  isRecommendedByShiprocketSelected = false;
                                  isFastestContainerOptionSelected = false;
                                });
                              },
                              child: CourierPriorityOption(
                                isContainerSelected:
                                    isBestRatedContainerOptionSelected,
                                text: 'Best Rated',
                                iconData: MyIcons.rate_us,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isBestRatedContainerOptionSelected = false;
                                  isCheapestContainerOptionSelected = false;
                                  isCustomContainerOptionSelected = true;
                                  isRecommendedByShiprocketSelected = false;
                                  isFastestContainerOptionSelected = false;
                                });
                              },
                              child: Stack(
                                children: [
                                  CourierPriorityOption(
                                    isContainerSelected:
                                        isCustomContainerOptionSelected,
                                    iconData: MyIcons.settings,
                                    text: 'Custom',
                                  ),
                                  isCustomContainerOptionSelected
                                      ? Positioned(
                                          bottom: 0,
                                          left: 0,
                                          right: 0,
                                          child: Transform.translate(
                                            offset: const Offset(0, 11.5),
                                            child: Container(
                                              width: double.infinity,
                                              alignment: Alignment.bottomCenter,
                                              child: SizedBox(
                                                width: 22.5,
                                                height: 12.5,
                                                child: Transform.rotate(
                                                  angle: 3.14,
                                                  child: CustomPaint(
                                                    painter: TrianglePainter(
                                                      strokeColor: ColorStyle
                                                          .colorPrimary,
                                                      strokeWidth: 10,
                                                      paintingStyle:
                                                          PaintingStyle.fill,
                                                    ),
                                                    child: const SizedBox(
                                                      height: 20,
                                                      width: 20,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      : const SizedBox(),
                                  isCustomContainerOptionSelected
                                      ? Positioned(
                                          bottom: 0,
                                          left: 0,
                                          right: 0,
                                          child: Transform.translate(
                                            offset: const Offset(0, 10),
                                            child: Container(
                                              width: double.infinity,
                                              alignment: Alignment.bottomCenter,
                                              child: SizedBox(
                                                width: 20,
                                                height: 11,
                                                child: Transform.rotate(
                                                  angle: 3.14,
                                                  child: CustomPaint(
                                                    painter: TrianglePainter(
                                                      strokeColor: Colors.white,
                                                      strokeWidth: 10,
                                                      paintingStyle:
                                                          PaintingStyle.fill,
                                                    ),
                                                    child: const SizedBox(
                                                      height: 20,
                                                      width: 20,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            isCustomContainerOptionSelected
                                ? Container(
                                    margin: const EdgeInsets.only(
                                      bottom: 15,
                                    ),
                                    padding: const EdgeInsets.all(12.0),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                        color: const Color.fromARGB(
                                            43, 82, 121, 247),
                                      ),
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              SizedBox(
                                                height: 20,
                                                child: Icon(Icons.info),
                                              ),
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  'To set a Custom Courier Priority, please visit website.',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              const SizedBox(
                                                width: 30,
                                              ),
                                              Text(
                                                'https://app.shiprocket.in/courierPriority',
                                                style: TextStyle(
                                                  color:
                                                      ColorStyle.colorPrimary,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: ColorStyle.colorPrimary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9.0),
                              ),
                            ),
                            onPressed: (isBestRatedContainerOptionSelected ||
                                    isCheapestContainerOptionSelected ||
                                    isFastestContainerOptionSelected ||
                                    isRecommendedByShiprocketSelected)
                                ? () {}
                                : null,
                            child: const Text(
                              'Save',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
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

class CourierPriorityOption extends StatelessWidget {
  const CourierPriorityOption({
    Key? key,
    required this.isContainerSelected,
    required this.text,
    required this.iconData,
  }) : super(key: key);

  final bool isContainerSelected;
  final String text;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: isContainerSelected ? ColorStyle.colorPrimary : Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          isContainerSelected
              ? Container(
                  decoration: BoxDecoration(
                    color: ColorStyle.colorPrimary,
                  ),
                  width: 6,
                  height: double.infinity,
                )
              : const SizedBox(
                  width: 6,
                ),
          const SizedBox(
            width: 10,
          ),
          Icon(
            iconData,
            color: ColorStyle.colorPrimary,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  final double strokeWidth;

  TrianglePainter(
      {this.strokeColor = Colors.black,
      this.strokeWidth = 3,
      this.paintingStyle = PaintingStyle.stroke});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..style = paintingStyle;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(0, y)
      ..lineTo(x / 2, 0)
      ..lineTo(x, y)
      ..lineTo(0, y);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) {
    return oldDelegate.strokeColor != strokeColor ||
        oldDelegate.paintingStyle != paintingStyle ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
