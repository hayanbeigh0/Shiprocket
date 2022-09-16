class ExpenseData {
  final String expenseCategory;
  final num father;
  final num mother;
  final num son;
  final num daughter;

  ExpenseData(
      this.expenseCategory, this.father, this.mother, this.son, this.daughter);
}

List<ExpenseData> getChartData() {
  final List<ExpenseData> chartData = [
    ExpenseData('Food', 0, 0, 0, 0),
    ExpenseData('Transport', 0, 0, 0, 0),
    ExpenseData('Medical', 0, 0, 0, 0),
    ExpenseData('Clothes', 0, 0, 0, 0),
    ExpenseData('Books', 0, 0, 0, 0),
  ];
  return chartData;
}
