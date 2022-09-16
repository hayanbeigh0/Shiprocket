import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:shiprocket/widgets/passbook_filters.dart';

import 'passbook_tab.dart';
import 'wallet_tab.dart';

class WalletAndPassbookTab extends StatefulWidget {
  WalletAndPassbookTab({Key? key}) : super(key: key);

  @override
  State<WalletAndPassbookTab> createState() => _WalletAndPassbookTabState();
}

class _WalletAndPassbookTabState extends State<WalletAndPassbookTab> {
  bool passbookTabActive = false;

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
                  'Wallet & Passbook',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                passbookTabActive
                    ? Row(
                        children: [
                          const Icon(
                            Icons.search,
                            size: 30,
                            color: Color.fromARGB(174, 0, 0, 0),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          PassbookFilters(),
                        ],
                      )
                    : const SizedBox(),
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
                      'Wallet',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Passbook',
                    ),
                  ),
                ],
                initialIndex: 0,
                onChange: (p0) {
                  setState(() {
                    p0.isOdd
                        ? passbookTabActive = true
                        : passbookTabActive = false;
                  });
                },
                views: const [
                  WalletTab(),
                  PassbookTab(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
