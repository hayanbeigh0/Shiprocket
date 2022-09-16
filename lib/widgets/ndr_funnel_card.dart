import 'package:flutter/material.dart';

import 'ndr_funnel_list_item.dart';

class NDRFunnelCard extends StatelessWidget {
  const NDRFunnelCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Shipments in NDR 1st Attempt: 0',
          ),
          SizedBox(
            height: 40,
          ),
          NDRFunnelListItem(),
          SizedBox(
            height: 40,
          ),
          Text(
            'Shipments in NDR 2st Attempt: 0',
          ),
          SizedBox(
            height: 40,
          ),
          NDRFunnelListItem(),
          SizedBox(
            height: 40,
          ),
          Text(
            'Shipments in NDR 3st Attempt: 0',
          ),
          SizedBox(
            height: 40,
          ),
          NDRFunnelListItem(),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
