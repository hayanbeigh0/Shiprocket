import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PickupPerformancePercentListItem extends StatelessWidget {
  const PickupPerformancePercentListItem({
    Key? key,
    required this.pickupPerformanceListPercentage,
    required this.pickupPerformanceListHeading,
    required this.pickupPerformanceListDescription,
  }) : super(key: key);

  final double pickupPerformanceListPercentage;
  final String pickupPerformanceListHeading;
  final String pickupPerformanceListDescription;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 92,
            padding: EdgeInsets.zero,
            child: Center(
              child: CircularPercentIndicator(
                radius: 40.0,
                lineWidth: 5.5,
                percent: pickupPerformanceListPercentage,
                center: Text(
                  pickupPerformanceListPercentage == 0.0
                      ? '0%'
                      : '${pickupPerformanceListPercentage * 100}%',
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
                progressColor: Colors.green,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(pickupPerformanceListHeading),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    pickupPerformanceListDescription,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 158, 158, 158),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
