import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';

import 'all_other_invoices.dart';
import 'freight_invoices.dart';

class Invoices extends StatelessWidget {
  const Invoices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(43, 82, 121, 247),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(70),
                bottomRight: Radius.circular(70),
              ),
            ),
            height: 130,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 27,
                    color: Color.fromARGB(136, 0, 0, 0),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  'Invoices',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: ContainedTabBarView(
                tabBarProperties: const TabBarProperties(
                  indicatorWeight: 5,
                  indicatorColor: Color.fromARGB(212, 87, 39, 176),
                  labelColor: Color.fromARGB(212, 87, 39, 176),
                  unselectedLabelColor: Color.fromARGB(134, 0, 0, 0),
                  labelPadding: EdgeInsets.all(8),
                ),
                tabs: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Freight Invoices',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'All Other Invoices',
                    ),
                  ),
                ],
                initialIndex: 0,
                views: const [
                  FreightInvoices(),
                  AllOtherInvoices(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
