import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../my_bus_icons.dart';
import '../my_icons_icons.dart';
import '../utils/color.dart';

class CourierCompanyCard extends StatefulWidget {
  const CourierCompanyCard({
    Key? key,
    required this.isDeliveryBoyNumberAvailable,
    required this.isCallBeforeDeliveryAvailable,
    required this.isPodInstant,
    required this.isTrackingRealTime,
    required this.rating,
    required this.courierCompanyImgUrl,
    required this.courierCompanyName,
  }) : super(key: key);
  final bool isDeliveryBoyNumberAvailable;
  final bool isCallBeforeDeliveryAvailable;
  final bool isPodInstant;
  final bool isTrackingRealTime;
  final double rating;
  final String courierCompanyImgUrl;
  final String courierCompanyName;

  @override
  State<CourierCompanyCard> createState() => _CourierCompanyCardState();
}

class _CourierCompanyCardState extends State<CourierCompanyCard> {
  bool switchButton = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 60,
                  child: Image.network(
                    widget.courierCompanyImgUrl,
                  ),
                ),
                SizedBox(
                  width: 80,
                  height: 60,
                  child: Text(
                    widget.courierCompanyName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        MyBus.shippingFast,
                        size: 15,
                        color: Color.fromARGB(255, 79, 79, 79),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Surface',
                        style: TextStyle(
                          color: Color.fromARGB(255, 62, 62, 62),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                CircularPercentIndicator(
                  radius: 19.0,
                  lineWidth: 5.5,
                  percent: widget.rating / 5,
                  center: Text(
                    widget.rating.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  progressColor: Colors.green,
                ),
                Switch(
                  activeTrackColor: const Color.fromARGB(255, 229, 225, 225),
                  activeColor: ColorStyle.colorPrimary,
                  value: switchButton,
                  onChanged: (value) {
                    setState(() {
                      switchButton = !switchButton;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 240, 240, 240),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 95,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.person_outline,
                          size: 40,
                        ),
                        const Text(
                          'Delivery Boy Number',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 102, 101, 101),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.isDeliveryBoyNumberAvailable
                              ? 'Available'
                              : 'Not Available',
                          style: TextStyle(
                            fontSize: 14,
                            color: widget.isDeliveryBoyNumberAvailable
                                ? Colors.green
                                : const Color.fromARGB(255, 166, 37, 27),
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.call_outlined,
                          size: 35,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Text(
                          'Call Before Delivery',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 102, 101, 101),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.isCallBeforeDeliveryAvailable
                              ? 'Available'
                              : 'Not Available',
                          style: TextStyle(
                            fontSize: 14,
                            color: widget.isCallBeforeDeliveryAvailable
                                ? Colors.green
                                : const Color.fromARGB(255, 166, 37, 27),
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 70,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.gif_box,
                          size: 35,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Text(
                          'Tracking Service',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 102, 101, 101),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.isTrackingRealTime
                              ? 'Real Time'
                              : 'Not Real Time',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: widget.isTrackingRealTime
                                ? Colors.green
                                : const Color.fromARGB(255, 166, 37, 27),
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 65,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          MyIcons.manifests,
                          size: 35,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Text(
                          'POD',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 102, 101, 101),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.isPodInstant ? 'Instant' : 'On Request',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: widget.isPodInstant
                                ? Colors.green
                                : const Color.fromARGB(255, 166, 37, 27),
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
