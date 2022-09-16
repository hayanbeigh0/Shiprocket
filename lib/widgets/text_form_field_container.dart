import 'package:flutter/material.dart';

class TextFormFieldContainer extends StatelessWidget {
  const TextFormFieldContainer({
    Key? key,
    required this.textForm,
    this.backgroundColor = const Color.fromARGB(255, 255, 255, 255),
    this.borderColor = const Color.fromARGB(255, 208, 207, 207),
  }) : super(key: key);

  final Widget textForm;
  final Color backgroundColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            5,
          ),
        ),
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
        ),
        child: textForm,
      ),
    );
  }
}
