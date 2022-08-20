import 'package:charts_flutter/flutter.dart' as charts;

class BarChartModel {

  String year;
  int marks;
  final charts.Color color;

  BarChartModel({required this.year, required this.marks, required this.color,});
}