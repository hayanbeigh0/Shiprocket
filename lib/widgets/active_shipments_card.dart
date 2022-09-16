import 'package:flutter/material.dart';

class ActiveShipmentsCard extends StatelessWidget {
  const ActiveShipmentsCard({
    Key? key,
    required this.activeShipmentsCount,
    required this.activeShipmentsStatus,
  }) : super(key: key);

  final String activeShipmentsCount;
  final String activeShipmentsStatus;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 115,
      child: Card(
        elevation: 4,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 35.0,
                  vertical: 20,
                ),
                child: Text(
                  activeShipmentsCount,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(60, 26, 112, 1),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 10.0,
                    top: 10.0,
                  ),
                  child: Text(
                    activeShipmentsStatus,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
