import 'package:flutter/material.dart';
import 'package:shiprocket/screens/bottom_navigation.dart';

class SignupOptions extends StatelessWidget {
  const SignupOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const BottomNavigation(),
                ),
                (route) => false,
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        100,
                      ),
                    ),
                    border: Border.all(
                      color: const Color.fromARGB(255, 208, 207, 207),
                      width: 0.5,
                    ),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: Image.asset(
                    'assets/facebook-icon.PNG',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Facebook',
              style: TextStyle(
                color: Color.fromARGB(255, 71, 70, 70),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 30,
        ),
        Column(
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const BottomNavigation(),
                ),
                (route) => false,
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        100,
                      ),
                    ),
                    border: Border.all(
                      color: const Color.fromARGB(255, 208, 207, 207),
                      width: 0.5,
                    ),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/google-icon.PNG',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Goolge',
              style: TextStyle(
                color: Color.fromARGB(255, 71, 70, 70),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
