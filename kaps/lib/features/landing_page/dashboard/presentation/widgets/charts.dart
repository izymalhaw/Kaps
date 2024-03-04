import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

Widget charts(String title, String name) {
  List<_SalesData> data = [
    _SalesData('Jan', 0),
    _SalesData('Feb', 0),
    _SalesData('Mar', 0),
    _SalesData('Apr', 0),
    _SalesData('May', 0)
  ];
  return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      title: ChartTitle(text: title),
      legend: Legend(isVisible: true),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <CartesianSeries<_SalesData, String>>[
        LineSeries<_SalesData, String>(
            dataSource: data,
            xValueMapper: (_SalesData sales, _) => sales.year,
            yValueMapper: (_SalesData sales, _) => sales.sales,
            name: name,
            dataLabelSettings: DataLabelSettings(isVisible: true))
      ]);
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
