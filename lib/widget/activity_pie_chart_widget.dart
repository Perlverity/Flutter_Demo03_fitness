import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';
import 'indicator_widget.dart';

class ActivityPieChart extends StatefulWidget {
  @override
  _ActivityPieChartState createState() => _ActivityPieChartState();
}

class _ActivityPieChartState extends State<ActivityPieChart> {
  int _touchedIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.blockSizeVertical * 25,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
              width: SizeConfig.blockSizeHorizontal * 60,
              child: PieChart(
                PieChartData(
                  borderData: FlBorderData(
                    show: false,
                  ),
                  centerSpaceRadius: 50.0,
                  sectionsSpace: 0.0,
                  startDegreeOffset: 30.0,
                  sections: showingSections(),
                  pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                    setState(() {
                      if (!event.isInterestedForInteractions ||
                          pieTouchResponse == null ||
                          pieTouchResponse.touchedSection == null) {
                        _touchedIndex = -1;
                      } else {
                        _touchedIndex =
                            pieTouchResponse.touchedSection.touchedSectionIndex;
                        ;
                      }
                    });
                  }),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: SizeConfig.blockSizeVertical * 3),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IndicatorWidget(
                      color: CustomColors.kPrimaryColor,
                      iconPath: 'assets/icons/running.svg',
                      title: 'RUNNING',
                      subtitle: '10 KM',
                    ),
                    IndicatorWidget(
                      color: CustomColors.kCyanColor,
                      iconPath: 'assets/icons/bike.svg',
                      title: 'CYCLING',
                      subtitle: '10 KM',
                    ),
                    IndicatorWidget(
                      color: CustomColors.kLightPinkColor,
                      iconPath: 'assets/icons/swimmer.svg',
                      title: 'SWIMMING',
                      subtitle: '10 KM',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final isTouched = i == _touchedIndex;
      final double radius = isTouched ? 30 : 20;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: CustomColors.kLightPinkColor,
            value: 33.33,
            title: '', // this cannot be left blank
            radius: radius,
          );
        case 1:
          return PieChartSectionData(
            color: CustomColors.kPrimaryColor,
            value: 33.33,
            title: '', // this cannot be left blank
            radius: radius,
          );
        case 2:
          return PieChartSectionData(
            color: CustomColors.kCyanColor,
            value: 33.33,
            title: '', // this cannot be left blank
            radius: radius,
          );
        default:
          return null;
      }
    });
  }
}
