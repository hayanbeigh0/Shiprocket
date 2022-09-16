import 'package:flutter/material.dart';

import '../utils/color.dart';

class FilterOption extends StatelessWidget {
  const FilterOption({
    Key? key,
    required this.optionSelected,
    required this.filterOptionTitle,
  }) : super(key: key);

  final bool optionSelected;
  final String filterOptionTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 10.0,
          ),
          child: Row(
            children: [
              SizedBox(
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: const Color.fromARGB(255, 191, 190, 190),
                  child: optionSelected == true
                      ? Padding(
                          padding: const EdgeInsets.all(
                            3.3,
                          ),
                          child: CircleAvatar(
                            backgroundColor: ColorStyle.colorPrimary,
                          ),
                        )
                      : const SizedBox(),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  filterOptionTitle,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
