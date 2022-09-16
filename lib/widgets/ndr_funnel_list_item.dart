import 'package:flutter/material.dart';

class NDRFunnelListItem extends StatelessWidget {
  const NDRFunnelListItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          const Expanded(
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(112, 158, 158, 158),
              radius: 50,
              child: Text(
                'NA',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Color.fromARGB(194, 244, 57, 54),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text('Pending Shipments')
                  ],
                ),
                Row(
                  children: const [
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Color.fromARGB(255, 255, 145, 0),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text('Delivered Shipments')
                  ],
                ),
                Row(
                  children: const [
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Color.fromARGB(133, 33, 51, 243),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text('Other')
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
