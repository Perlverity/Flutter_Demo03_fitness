import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';
import '../size_config.dart';

class IndicatorWidget extends StatelessWidget {
  final Color color;
  final String title;
  final String subtitle;
  final String iconPath;

  const IndicatorWidget(
      {Key key, this.color, this.title, this.subtitle, this.iconPath})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          iconPath,
          height: SizeConfig.blockSizeVertical * 4,
          color: color,
        ),
        SizedBox(
          width: SizeConfig.blockSizeHorizontal * 1,
        ),
        Column(
          children: [
            Text(
              title,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              subtitle,
              style:
                  TextStyle(color: CustomColors.kLightColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
