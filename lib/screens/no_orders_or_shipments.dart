import 'package:flutter/material.dart';

class NoOrdersOrShipments extends StatelessWidget {
  const NoOrdersOrShipments({
    Key? key,
    required this.infoText,
    required this.screenTitleText,
    required this.buttonText,
  }) : super(key: key);

  void onPressed() {}
  final String infoText;
  final String screenTitleText;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(43, 82, 121, 247),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(70),
              bottomRight: Radius.circular(70),
            ),
          ),
          height: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                width: 20,
              ),
              const Icon(
                Icons.arrow_back,
                size: 30,
                color: Color.fromARGB(136, 0, 0, 0),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                screenTitleText,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.search,
                size: 35,
                color: Color.fromARGB(174, 0, 0, 0),
              ),
              const SizedBox(
                width: 20,
              ),
              Image.asset(
                'assets/controls.png',
                width: 30,
                color: const Color.fromARGB(174, 0, 0, 0),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(5.0),
            child: Card(
              elevation: 10,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/sadboxcopy.png',
                    height: 200,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    infoText,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(174, 0, 0, 0),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 13,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    onPressed: onPressed,
                    child: Text(
                      buttonText,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
