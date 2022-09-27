import 'package:flutter/material.dart';

class FreightInvoices extends StatelessWidget {
  const FreightInvoices({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            0.23,
            0.23,
            1.0,
          ],
        ),
      ),
      // padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: const Color.fromARGB(255, 212, 210, 210),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0.8,
                          blurRadius: 2,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Image.asset('assets/no-invoices.PNG'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
