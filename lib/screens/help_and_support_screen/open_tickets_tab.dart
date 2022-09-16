import 'package:flutter/material.dart';

class OpenTickets extends StatelessWidget {
  const OpenTickets({super.key});

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
