import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../chart/bar_model.dart';
import 'bar_model.dart';

class BarsChart extends StatefulWidget {
  const BarsChart({Key? key}) : super(key: key);

  @override
  State<BarsChart> createState() => _BarsChartState();
}

class _BarsChartState extends State<BarsChart> {
  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }

  late List<ExpenseData> _chartData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: SfCartesianChart(
        legend: Legend(
          textStyle: const TextStyle(
            fontSize: 11,
          ),
          iconHeight: 8,
          iconWidth: 8,
          isVisible: true,
          position: LegendPosition.bottom,
          orientation: LegendItemOrientation.horizontal,
          alignment: ChartAlignment.far,
          padding: 5,
        ),
        series: <ChartSeries>[
          StackedColumn100Series<ExpenseData, String>(
            dataSource: _chartData,
            xValueMapper: (datum, index) => datum.expenseCategory,
            yValueMapper: (datum, index) => datum.father,
            name: 'Delivered',
            legendIconType: LegendIconType.rectangle,
            color: Colors.green,
          ),
          StackedColumn100Series<ExpenseData, String>(
            dataSource: _chartData,
            xValueMapper: (datum, index) => datum.expenseCategory,
            yValueMapper: (datum, index) => datum.mother,
            name: 'In Transit',
            legendIconType: LegendIconType.rectangle,
            color: const Color.fromARGB(255, 209, 188, 3),
          ),
          StackedColumn100Series<ExpenseData, String>(
            dataSource: _chartData,
            xValueMapper: (datum, index) => datum.expenseCategory,
            yValueMapper: (datum, index) => datum.son,
            name: 'Picked Up',
            legendIconType: LegendIconType.rectangle,
            color: const Color.fromARGB(255, 93, 2, 109),
          ),
          StackedColumn100Series<ExpenseData, String>(
            dataSource: _chartData,
            xValueMapper: (datum, index) => datum.expenseCategory,
            yValueMapper: (datum, index) => datum.daughter,
            name: 'NDR',
            legendIconType: LegendIconType.rectangle,
            color: const Color.fromARGB(255, 4, 112, 200),
          ),
          StackedColumn100Series<ExpenseData, String>(
            dataSource: _chartData,
            xValueMapper: (datum, index) => datum.expenseCategory,
            yValueMapper: (datum, index) => datum.daughter,
            name: 'RTO',
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
    );
  }
}
