import 'package:fitness/widget/activity_pie_chart_widget.dart';
import 'package:fitness/widget/heading_widget.dart';
import 'package:fitness/widget/hourly_bar_chart_widget.dart';
import 'package:fitness/widget/weekly_bar_chart_widget.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class MetricScreen extends StatelessWidget {
  // Data we need to draw two bar graphs.
  final List<int> weeklyData = [10, 12, 4, 16, 20, 16, 14];
  final List<int> hourlyData = [
    5,
    7,
    10,
    11,
    17,
    18,
    14,
    15,
    12,
    11,
    8,
    7,
    11,
    19,
    6,
    8,
    10,
    12,
    18,
    16,
    14,
    17,
    11,
    13
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.blockSizeVertical * 82,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        color: CustomColors.kBackgroundColor,
      ),
      child: Column(
        children: [
          HeadingWidget(text1: "Exercise", text2: ""),
          ActivityPieChart(),
          HeadingWidget(text1: "Goal Compilance", text2: ""),
          WeeklyBarChart(weeklyData: weeklyData, maximumValueOnYAxis: 22.0),
          HeadingWidget(text1: "Exercise Avg", text2: ""),
          HourlyBarChartWidget(hourlyData: hourlyData, maximumValueOnYAxis: 22.0),
        ],
      ),
    );
  }
}
