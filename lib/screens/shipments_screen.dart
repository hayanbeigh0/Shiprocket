import 'package:flutter/material.dart';
import '/screens/no_orders_or_shipments.dart';

class ShipmentsScreen extends StatelessWidget {
  const ShipmentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NoOrdersOrShipments(
      infoText: 'No shipments to show here',
      screenTitleText: 'Shipments',
      buttonText: 'Add Your First Shipment',
    );
  }
}
