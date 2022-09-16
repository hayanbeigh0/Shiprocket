import 'package:flutter/material.dart';

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
            CircleAvatar(
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
                padding: const EdgeInsets.all(16.0),
                child: Image.network(
                  'https://www.edigitalagency.com.au/wp-content/uploads/Facebook-logo-blue-circle-large-transparent-png.png',
                  fit: BoxFit.cover,
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
            CircleAvatar(
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
                child: Image.network(
                  'https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png',
                  fit: BoxFit.cover,
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
