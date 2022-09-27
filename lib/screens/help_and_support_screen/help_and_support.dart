import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiprocket/my_custom_icons_icons.dart';
import 'package:shiprocket/screens/help_and_support_screen/close_tickets_tab.dart';
import 'package:shiprocket/screens/help_and_support_screen/create_tickets_tab.dart';
import 'package:shiprocket/screens/help_and_support_screen/open_tickets_tab.dart';
import 'package:shiprocket/utils/color.dart';
import 'package:shiprocket/widgets/common_top_bar.dart';

import '../../models/filter_options.dart';
import '../../widgets/filter_category.dart';
import '../../widgets/filter_options.dart';

class HelpAndSupport extends StatefulWidget {
  const HelpAndSupport({super.key});

  @override
  State<HelpAndSupport> createState() => _HelpAndSupportState();
}

class _HelpAndSupportState extends State<HelpAndSupport> {
  VoidCallback onTap = () {};

  String helpAndSupportCategoryText = 'Create New Shipments';

  bool createTicketTabActive = true;
  bool openTicketTabActive = false;
  bool closeTicketTabActive = false;
  int tabIndex = 0;
  List<FilterOptions> filterOptionsByStatus = [
    FilterOptions('All', true),
    FilterOptions('Pickup Scheduled', false),
    FilterOptions('Pickup Error', false),
    FilterOptions('Pickup Queued', false),
  ];
  List<FilterOptions> filterOptionsByCourier = [
    FilterOptions('All', true),
    FilterOptions('Blue Dart', false),
    FilterOptions('Amazon Shipping 5Kg', false),
    FilterOptions('DDC Surface', false),
    FilterOptions('Delhiverv', false),
    FilterOptions('Delhiverv Documents 2Kg', false),
    FilterOptions('Ecom Express Surface', false),
    FilterOptions('Ecom Express Surface 2kg', false),
    FilterOptions('Bluedart Air - Cards', false),
    FilterOptions('Bluedart Surface 500 ams-Select', false),
    FilterOptions('Xpressbees 1kg', false),
    FilterOptions('Xpressbees 2kg', false),
    FilterOptions('Xpressbees 5ka', false),
    FilterOptions('Delhiverv Reverse 20kg', false),
  ];
  List<FilterOptions> filterOptionsByDate = [
    FilterOptions('All', true),
    FilterOptions('Today', false),
    FilterOptions('Yesterdav', false),
    FilterOptions('Last 7 Davs', false),
    FilterOptions('Last 30 Days', false),
    FilterOptions('This Month', false),
    FilterOptions('Last Month', false),
    FilterOptions('Custom', false),
  ];
  List<FilterOptions> selectedList = [];
  bool isStatusOptionSelected = true;
  bool isCourierOptionSelected = false;
  bool isEscalationsOptionSelected = false;

  bool isDateSelected = false;

  bool optionSelected = true;

  @override
  Widget build(BuildContext context) {
    selectedList = filterOptionsByStatus;
    return Scaffold(
      body: Column(
        children: [
          CommonTopBar(
            title: 'Help & Support',
            trailingWidget: tabIndex != 0
                ? Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Transform.rotate(
                          angle: 3.14 / 2,
                          child: const Icon(
                            MyCustomIcons.exchange,
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        const Icon(
                          Icons.search,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        GestureDetector(
                          onTap: () => showFilterModalSheet(context),
                          child: SizedBox(
                            width: 24,
                            child: Image.asset('assets/controls.png'),
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
          ),
          const SizedBox(
            height: 5,
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
                        'Create Ticket',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Open Tickets',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Close Tickets',
                      ),
                    ),
                  ],
                  initialIndex: 0,
                  onChange: (p0) {
                    setState(
                      () {
                        tabIndex = p0;
                      },
                    );
                  },
                  views: [
                    CreateTickets(),
                    const OpenTickets(),
                    CloseTickets(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showFilterModalSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) => SingleChildScrollView(
          child: SizedBox(
            height: 700,
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Filters',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Icon(
                          Icons.close,
                          size: 30,
                          color: Color.fromARGB(255, 99, 99, 99),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.40,
                        height: double.infinity,
                        color: ColorStyle.colorPrimaryExtraLight100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                setModalState(() {
                                  selectedList = filterOptionsByStatus;
                                  isStatusOptionSelected = true;
                                  isDateSelected = false;
                                  isCourierOptionSelected = false;
                                });
                              },
                              child: FilterCategory(
                                categorySelected: isStatusOptionSelected,
                                categoryText: 'Status',
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setModalState(() {
                                  selectedList = filterOptionsByCourier;
                                  isStatusOptionSelected = false;
                                  isDateSelected = false;
                                  isCourierOptionSelected = true;
                                });
                              },
                              child: FilterCategory(
                                categorySelected: isCourierOptionSelected,
                                categoryText: 'Courier',
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                selectedList = filterOptionsByDate;
                                setModalState(() {
                                  isStatusOptionSelected = false;
                                  isDateSelected = true;
                                  isCourierOptionSelected = false;
                                });
                              },
                              child: FilterCategory(
                                categorySelected: isDateSelected,
                                categoryText: 'Date',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: selectedList.length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              setModalState(() {
                                for (var element in selectedList) {
                                  element.isSelected = false;
                                }
                                selectedList[index].isSelected = true;
                              });
                            },
                            child: FilterOption(
                              optionSelected: selectedList[index].isSelected,
                              filterOptionTitle: selectedList[index].title,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setModalState(() {
                                for (var element in filterOptionsByStatus) {
                                  element.isSelected = false;
                                }
                                for (var element in filterOptionsByDate) {
                                  element.isSelected = false;
                                }
                                for (var element in filterOptionsByCourier) {
                                  element.isSelected = false;
                                }
                                filterOptionsByDate[0].isSelected = true;
                                filterOptionsByStatus[0].isSelected = true;
                                filterOptionsByCourier[0].isSelected = true;
                              });
                              isStatusOptionSelected = true;
                              isDateSelected = false;
                              isCourierOptionSelected = false;
                              isEscalationsOptionSelected = false;
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Clear All',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        const VerticalDivider(),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Text(
                              'Apply',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: ColorStyle.colorPrimary,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HelpAndSupportCategory extends StatelessWidget {
  const HelpAndSupportCategory({
    Key? key,
    required this.helpAndSupportCategoryText,
    required this.onTap,
  }) : super(key: key);

  final String helpAndSupportCategoryText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(73, 114, 195, 236),
        borderRadius: BorderRadius.circular(5.0),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(helpAndSupportCategoryText),
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: const Icon(
              CupertinoIcons.chevron_right,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
