import 'package:flutter/material.dart';
import 'package:shiprocket/utils/color.dart';

class DeactivatedCourierCompanies extends StatelessWidget {
  const DeactivatedCourierCompanies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      color: const Color.fromARGB(255, 251, 251, 251),
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/no-record.png"),
          const Text(
            'No Record Exists!',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: ColorStyle.colorPrimary,
              padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 10.0,
              ),
            ),
            child: const Text(
              'Retry',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
