import 'package:flutter/material.dart';

import '../models/filter_options.dart';
import '../utils/color.dart';
import '../widgets/common_top_bar.dart';
import '../widgets/filter_category.dart';
import '../widgets/filter_options.dart';

class CODRemmitance extends StatelessWidget {
  CODRemmitance({super.key});
  bool isDateSelected = true;
  bool optionSelected = true;
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
    selectedList = filterOptionsByDate;
    return Scaffold(
        body: Column(
      children: [
        CommonTopBar(
          title: 'COD Remmitance',
          trailingWidget: GestureDetector(
            onTap: () {
              showFilterModalSheet(context);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              width: 24,
              child: Image.asset(
                'assets/controls.png',
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              shadowColor: const Color.fromARGB(77, 75, 33, 243),
              borderOnForeground: true,
              child: Center(
                child: Image.asset(
                  "assets/no-record.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 60,
        ),
      ],
    ));
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
                                  selectedList = filterOptionsByDate;
                                  isDateSelected = false;
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
                                for (var element in filterOptionsByDate) {
                                  element.isSelected = false;
                                }
                                filterOptionsByDate[0].isSelected = true;
                              });
                              isDateSelected = true;
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
