import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWithTrailingContainer extends StatelessWidget {
  const TextFieldWithTrailingContainer({
    Key? key,
    required this.textFieldWithTrailingContainerWidth,
    required this.textFieldWithTrailingContainerLabelText,
    required this.textFieldTrailingContainerText,
  }) : super(key: key);
  final double textFieldWithTrailingContainerWidth;
  final String textFieldWithTrailingContainerLabelText;
  final String textFieldTrailingContainerText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: textFieldWithTrailingContainerWidth,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 55,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(
                    5,
                  ),
                  bottomLeft: Radius.circular(5),
                ),
                border: Border.all(
                  color: const Color.fromARGB(255, 208, 207, 207),
                  width: 1,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 14,
                ),
                child: TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                  ],
                  keyboardType: const TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  decoration: InputDecoration(
                    hintText: textFieldWithTrailingContainerLabelText,
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 111, 111, 112),
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                  ),
                  textInputAction: TextInputAction.next,
                ),
              ),
            ),
          ),
          Container(
            height: 55,
            clipBehavior: Clip.antiAlias,
            width: 45,
            decoration: BoxDecoration(
              color: const Color.fromARGB(212, 87, 39, 176),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(7),
                bottomRight: Radius.circular(7),
              ),
              border: Border.all(
                color: const Color.fromARGB(212, 87, 39, 176),
                width: 1,
              ),
            ),
            child: Center(
              child: Text(
                textFieldTrailingContainerText,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
