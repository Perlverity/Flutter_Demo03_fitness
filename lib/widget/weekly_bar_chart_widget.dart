import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeeklyBarChart extends StatelessWidget {
  final List<int> weeklyData;
  final double maximumValueOnYAxis;

  const WeeklyBarChart({Key key, this.weeklyData, this.maximumValueOnYAxis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.white,
          elevation: 0,
          child: Container(
            margin: EdgeInsets.only(top: 15.0),
            child: BarChart(
              mainBarData(),
            ),
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: y,
          width: 15.0,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: maximumValueOnYAxis,
          ),
        ),
      ],
    );
  }

  List<BarChartGroupData> showingGroups() {
    return List.generate(weeklyData.length, (index) {
      return makeGroupData(index, weeklyData[index].toDouble());
    });
  }

  FlTitlesData _buildAxes() {
    return FlTitlesData(
      show: true,
      leftTitles: SideTitles(
        showTitles: false,
      ),
      rightTitles: SideTitles(
        showTitles: false,
      ),
      topTitles: SideTitles(
        showTitles: false,
      ),
      bottomTitles: SideTitles(
          showTitles: true,
          margin: 12,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return 'Mon';
              case 1:
                return 'Tue';
              case 2:
                return 'Wed';
              case 3:
                return 'Thu';
              case 4:
                return 'Fri';
              case 5:
                return 'Sat';
              case 6:
                return 'Sun';
              default:
                return '';
            }
          }),
    );
  }

  BarChartData mainBarData() {
    return BarChartData(
      maxY: maximumValueOnYAxis,
      borderData: FlBorderData(
        show: false,
      ),
      groupsSpace: 30,
      titlesData: _buildAxes(),
      alignment: BarChartAlignment.center,
      barGroups: showingGroups(),
    );
  }
}
