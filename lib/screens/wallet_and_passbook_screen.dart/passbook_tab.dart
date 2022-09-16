import 'package:flutter/material.dart';

class PassbookTab extends StatelessWidget {
  final bool isPassbookEmpty = true;
  const PassbookTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isPassbookEmpty
        ? Image.asset(
            'assets/empty-passbook.jpeg',
            fit: BoxFit.cover,
          )
        : Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              gradient: const LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Color.fromARGB(119, 215, 216, 246),
                  Color.fromARGB(119, 215, 216, 246),
                ],
                stops: [
                  0.0,
                  0.2,
                  0.2,
                  1.0,
                ],
              ),
            ),
          );
  }
}
