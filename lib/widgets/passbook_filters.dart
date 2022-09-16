import 'package:flutter/material.dart';

import '../models/filter_options.dart';
import '../utils/color.dart';
import './filter_category.dart';
import './filter_options.dart';

class PassbookFilters extends StatelessWidget {
  PassbookFilters({Key? key}) : super(key: key);
  bool isCategorySelected = true;

  bool isDateSelected = false;

  bool optionSelected = true;

  String categoryText = 'Category';

  String filterOptionTitle = 'All';

  List<FilterOptions> filterOptionsByCategory = [
    FilterOptions('All', true),
    FilterOptions('Frieght Charge', false),
    FilterOptions('Freight Charge Reversed', false),
    FilterOptions('Excess Weight Charge', false),
    FilterOptions('RTO Freight Charge', false),
    FilterOptions('RTO Freight Reversed', false),
    FilterOptions('SR Credit', false),
    FilterOptions('Cancelled', false),
    FilterOptions('COD Charge', false),
    FilterOptions('COD Charge Reversed', false),
    FilterOptions('Lost Credit', false),
    FilterOptions('RTO Excess Weight Charge', false),
    FilterOptions('Damaged Credit', false),
    FilterOptions('RTO Excess Freight Reversed', false),
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

  @override
  Widget build(BuildContext context) {
    selectedList = filterOptionsByCategory;
    return GestureDetector(
      onTap: () {
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
                                      selectedList = filterOptionsByCategory;
                                      isCategorySelected = true;
                                      isDateSelected = false;
                                    });
                                  },
                                  child: FilterCategory(
                                    categorySelected: isCategorySelected,
                                    categoryText: categoryText,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    selectedList = filterOptionsByDate;
                                    setModalState(() {
                                      isCategorySelected = false;
                                      isDateSelected = true;
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
                                  optionSelected:
                                      selectedList[index].isSelected,
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
                                    for (var element
                                        in filterOptionsByCategory) {
                                      element.isSelected = false;
                                    }
                                    for (var element in filterOptionsByDate) {
                                      element.isSelected = false;
                                    }
                                    filterOptionsByDate[0].isSelected = true;
                                    filterOptionsByCategory[0].isSelected =
                                        true;
                                  });
                                  isCategorySelected = true;
                                  isDateSelected = false;
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
      },
      child: Image.asset(
        'assets/controls.png',
        width: 25,
        color: const Color.fromARGB(174, 0, 0, 0),
      ),
    );
  }
}
