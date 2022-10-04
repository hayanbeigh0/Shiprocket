import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../chart/bar_model.dart';

class WeightDiscrepancies extends StatefulWidget {
  const WeightDiscrepancies({Key? key}) : super(key: key);

  @override
  State<WeightDiscrepancies> createState() => _WeightDiscrepanciesState();
}

class _WeightDiscrepanciesState extends State<WeightDiscrepancies> {
  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }

  String? selectedValue;
  late List<ExpenseData> _chartData;

  String orderInfoType = 'Total Orders';

  String orderInfoDescription = 'All orders made by seller';
  String pickupPerformanceListHeading = 'Pickup within 24 Hours';
  double pickupPerformanceListPercentage = 0.0;
  String pickupPerformanceListDescription =
      '% shipments picked up within 24 hours from pickup scheduled date';

  double gridBorderWidth = 0.05;

  Color borderGrey = const Color.fromARGB(57, 0, 0, 0);

  Color textLightGrey = const Color.fromARGB(186, 0, 0, 0);

  var items = ['Today', 'Yesterday', 'Last 30 days', 'Custom'];

  int setPickupTab = 1;
  int setDeliveryTab = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Last Synced at: ${DateFormat('dd MMMM yyyy').format(DateTime.now())}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(128, 0, 0, 0),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Weight Discrepancies Overview',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(173, 0, 0, 0),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              // height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(5.0),
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
                    0.15,
                    0.15,
                    1.0,
                  ],
                ),
              ),
              child: Column(
                children: [
                  Card(
                    elevation: 5,
                    shadowColor: const Color.fromARGB(85, 75, 55, 226),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Total Shipment',
                                    style: TextStyle(
                                      color: Color.fromARGB(128, 0, 0, 0),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    '0',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              DropdownButton2(
                                hint: Text(
                                  'Last 30 days',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context).hintColor,
                                  ),
                                ),
                                items: items
                                    .map(
                                      (item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                value: selectedValue,
                                onChanged: (value) {
                                  setState(() {
                                    selectedValue = value as String;
                                  });
                                },
                                buttonDecoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: const Color.fromARGB(51, 0, 0, 0),
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    5,
                                  ),
                                ),
                                buttonPadding: const EdgeInsets.all(10),
                                buttonHeight: 40,
                                buttonWidth: 140,
                                itemHeight: 40,
                                underline: const SizedBox(),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: SfCartesianChart(
                            legend: Legend(
                              textStyle: const TextStyle(
                                fontSize: 11,
                              ),
                              iconHeight: 10,
                              iconWidth: 10,
                              isVisible: true,
                              position: LegendPosition.bottom,
                              orientation: LegendItemOrientation.horizontal,
                              alignment: ChartAlignment.far,
                              padding: 5,
                            ),
                            series: <ChartSeries>[
                              StackedColumn100Series<ExpenseData, String>(
                                dataSource: _chartData,
                                xValueMapper: (datum, index) =>
                                    datum.expenseCategory,
                                yValueMapper: (datum, index) => datum.father,
                                name: 'Accepted by seller',
                                legendIconType: LegendIconType.rectangle,
                                color: Colors.green,
                              ),
                              StackedColumn100Series<ExpenseData, String>(
                                dataSource: _chartData,
                                xValueMapper: (datum, index) =>
                                    datum.expenseCategory,
                                yValueMapper: (datum, index) => datum.mother,
                                name: 'Dispute Accepted by Courier',
                                legendIconType: LegendIconType.rectangle,
                                color: const Color.fromARGB(255, 209, 188, 3),
                              ),
                              StackedColumn100Series<ExpenseData, String>(
                                dataSource: _chartData,
                                xValueMapper: (datum, index) =>
                                    datum.expenseCategory,
                                yValueMapper: (datum, index) => datum.son,
                                name: 'Dispute Accepted by Courier',
                                legendIconType: LegendIconType.rectangle,
                                color: const Color.fromARGB(255, 93, 2, 109),
                              ),
                              StackedColumn100Series<ExpenseData, String>(
                                dataSource: _chartData,
                                xValueMapper: (datum, index) =>
                                    datum.expenseCategory,
                                yValueMapper: (datum, index) => datum.daughter,
                                name: 'Auto Accepted',
                                legendIconType: LegendIconType.rectangle,
                                color: const Color.fromARGB(255, 4, 112, 200),
                              ),
                              StackedColumn100Series<ExpenseData, String>(
                                dataSource: _chartData,
                                xValueMapper: (datum, index) =>
                                    datum.expenseCategory,
                                yValueMapper: (datum, index) => datum.daughter,
                                name: 'Pending',
                                legendIconType: LegendIconType.rectangle,
                                color: Colors.red,
                              ),
                            ],
                            primaryXAxis: CategoryAxis(
                              isVisible: false,
                            ),
                            primaryYAxis: NumericAxis(
                              interval: 2,
                              maximum: 10,
                            ),
                            // isTransposed: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(10.0),
          color: const Color.fromARGB(212, 215, 216, 246),
          width: double.infinity,
          height: 35,
          child: const Text(
            'Note: For detailed analysis, please check the web panel.',
            style: TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}
