import 'package:flutter/material.dart';
import 'package:shiprocket/widgets/common_top_bar.dart';

import '../models/filter_options.dart';
import '../utils/color.dart';
import '../widgets/filter_category.dart';
import '../widgets/filter_options.dart';

class WeightDiscrepancy extends StatelessWidget {
  WeightDiscrepancy({super.key});
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
            title: 'Weight Discrepancy',
            trailingWidget: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              width: 24,
              child: GestureDetector(
                onTap: () => showFilterModalSheet(context),
                child: Image.asset(
                  'assets/controls.png',
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Image.asset(
                  "assets/no-weight-discrepancies.jpeg",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 60,
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
