import 'package:flutter/material.dart';

class AddMoney extends StatelessWidget {
  const AddMoney({
    Key? key,
    this.onPressed,
    required this.amount,
  }) : super(key: key);
  final Color colorPrimary = const Color.fromARGB(206, 75, 33, 243);
  final VoidCallback? onPressed;
  final String amount;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: 3,
            vertical: 5,
          ),
          side: BorderSide(
            color: colorPrimary,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 3.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                size: 28,
                Icons.add,
                color: colorPrimary,
              ),
              Expanded(
                child: Text(
                  amount,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
