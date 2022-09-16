import 'package:flutter/material.dart';

import '../utils/color.dart';

class FilterCategory extends StatelessWidget {
  const FilterCategory({
    Key? key,
    required this.categorySelected,
    required this.categoryText,
  }) : super(key: key);

  final bool categorySelected;
  final String categoryText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 55.0,
          width: 6.0,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(5.0),
              bottomRight: Radius.circular(5.0),
            ),
            color:
                categorySelected ? ColorStyle.colorPrimary : Colors.transparent,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          categoryText,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: categorySelected ? ColorStyle.colorPrimary : Colors.black,
          ),
        )
      ],
    );
  }
}
