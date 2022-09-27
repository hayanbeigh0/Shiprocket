import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:shiprocket/screens/courier_companies/activated_courier_companies.dart';
import 'package:shiprocket/screens/courier_companies/all_courier_companies.dart';
import 'package:shiprocket/screens/courier_companies/deactivated_courier_companies.dart';

import '../../my_custom_icons_icons.dart';
import '../../utils/box_styles.dart';
import '../../utils/color.dart';

class CourierCompanies extends StatelessWidget {
  const CourierCompanies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
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
                const Text(
                  'Courier Companies',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
            ),
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
                    0.23,
                    0.23,
                    1.0,
                  ],
                ),
              ),
              // padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: ContainedTabBarView(
                tabBarProperties: const TabBarProperties(
                  indicatorWeight: 5,
                  indicatorColor: Color.fromARGB(212, 87, 39, 176),
                  labelColor: Color.fromARGB(212, 87, 39, 176),
                  unselectedLabelColor: Color.fromARGB(134, 0, 0, 0),
                  labelPadding: EdgeInsets.all(8),
                ),
                tabs: const [
                  Text(
                    'Activated',
                  ),
                  Text(
                    'Deactivated',
                  ),
                  Text(
                    'All',
                  ),
                ],
                views: const [
                  ActivatedCourierCompanies(),
                  DeactivatedCourierCompanies(),
                  AllCourierCompanies()
                ],
              ),
            ),
          ),
          SizedBox(
            height: 70,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Transform.rotate(
                            angle: 3.14 / 2,
                            child: Icon(
                              MyCustomIcons.exchange,
                              size: 20,
                              color: ColorStyle.colorPrimary,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Sort',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: ColorStyle.colorPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: VerticalDivider(),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            MyCustomIcons.filter,
                            size: 20,
                            color: ColorStyle.colorPrimary,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Filter',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: ColorStyle.colorPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
