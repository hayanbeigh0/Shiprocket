import 'package:flutter/material.dart';

class PickupPerformanceCountListItem extends StatelessWidget {
  const PickupPerformanceCountListItem({
    Key? key,
    required this.pickupPerformanceListCount,
    required this.pickupPerformanceListHeading,
    required this.pickupPerformanceCountListDescription,
  }) : super(key: key);

  final double pickupPerformanceListCount;
  final String pickupPerformanceListHeading;
  final String pickupPerformanceCountListDescription;

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
            padding: EdgeInsets.symmetric(
              // horizontal: 15,
              vertical: 30,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromARGB(35, 0, 0, 0),
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Center(
              child: Column(
                children: [
                  Text('O'),
                  Expanded(
                    child: Text(
                      'Out of O',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 158, 158, 158),
                      ),
                    ),
                  ),
                ],
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
                    pickupPerformanceCountListDescription,
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
