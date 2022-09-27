import 'package:flutter/material.dart';

import '../utils/box_styles.dart';

class CommonTopBar extends StatelessWidget {
  const CommonTopBar({
    Key? key,
    required this.title,
    this.trailingWidget = const SizedBox(),
  }) : super(key: key);
  final String title;
  final Widget trailingWidget;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxStyles.topBarContainerDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Color.fromARGB(136, 0, 0, 0),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          trailingWidget,
        ],
      ),
    );
  }
}
