import 'package:flutter/material.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:shiprocket/screens/dashboard_screen/cod_tab.dart';
import 'package:shiprocket/screens/dashboard_screen/ndr_tab.dart';
import 'package:shiprocket/screens/dashboard_screen/overview_tab.dart';
import 'package:shiprocket/screens/dashboard_screen/pickup_and_delivery_tab.dart';
import 'package:shiprocket/screens/dashboard_screen/weight_discrepancies.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

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
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Color.fromARGB(136, 0, 0, 0),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  'Dashboard',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: SizedBox(
              child: ContainedTabBarView(
                tabBarProperties: const TabBarProperties(
                  isScrollable: true,
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
                      'Overview',
                      style: TextStyle(
                          // color: Colors.black,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'COD',
                      style: TextStyle(
                          // color: Colors.black,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Pickup & Delivery',
                      style: TextStyle(
                          // color: Colors.black,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'NDR',
                      style: TextStyle(
                          // color: Colors.black,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Weight Discrepancies',
                      style: TextStyle(
                          // color: Colors.black,
                          ),
                    ),
                  ),
                ],
                views: const [
                  OverviewTab(),
                  CODTab(),
                  PickupAndDelivery(),
                  NDRTab(),
                  WeightDiscrepancies(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
