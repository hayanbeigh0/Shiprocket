import 'package:flutter/material.dart';

import '../../widgets/text_form_field_container.dart';

class CloseTickets extends StatelessWidget {
  CloseTickets({super.key});
  final items = ['Primary'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text('No Data Found'),
            Text(
              'Please clear filter and search if applied and try again',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
