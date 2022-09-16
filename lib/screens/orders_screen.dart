import 'package:flutter/material.dart';
import 'package:shiprocket/screens/no_orders_or_shipments.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  // final Function onPressed;
  void onPressed() {}
  final String infoText = 'No shipments to show here';
  final String screenTitleText = 'Orders';
  @override
  Widget build(BuildContext context) {
    return NoOrdersOrShipments(
      infoText: infoText,
      screenTitleText: screenTitleText,
      buttonText: 'Add Your First Shipment',
    );
  }
}
