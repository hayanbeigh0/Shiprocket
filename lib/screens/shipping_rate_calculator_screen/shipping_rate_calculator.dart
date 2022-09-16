import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import '/screens/shipping_rate_calculator_screen/domestic_shipments_tab.dart';
import '/screens/shipping_rate_calculator_screen/international_shipments_tab.dart';

class ShippingRateCalculator extends StatelessWidget {
  const ShippingRateCalculator({Key? key}) : super(key: key);

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
                  'Shipping Rate Calculator',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
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
                    0.2,
                    0.2,
                    1.0,
                  ],
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ContainedTabBarView(
                tabBarProperties: const TabBarProperties(
                  // isScrollable: true,
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
                      'Domestic',
                      style: TextStyle(
                          // color: Colors.black,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'International',
                      style: TextStyle(
                          // color: Colors.black,
                          ),
                    ),
                  ),
                ],
                views: [
                  const DomesticShipmentsTab(),
                  InternationsShipmentsTab(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
