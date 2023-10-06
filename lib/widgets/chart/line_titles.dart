import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stocks_app/utilities/app_constants.dart';

class LineTitles {
  static getTitleData() => const FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            getTitlesWidget: bottomTitleWidgets,
            reservedSize: 30,
            // interval: 1,
            showTitles: true,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 30, 
            interval: 1, 
            showTitles: true,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,  
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      );
}

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xFF7E8B96),
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  Widget text;
  switch (value.toInt()) {
    case 2:
      text = const Text('MAR', style: style);
      break;
    case 5:
      text =  Text(months[5], style: style);
      break;
     case 9:
      text =  Text(months[9], style: style);
      break;
    default:
      text = const Text('');
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 10,
    child: text,
  );
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xFF7E8B96),
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  String text;
  switch (value.toInt()) {
    case 2:
      text = lastTradePrice[0];
      break;

    case 4:
      text = lastTradePrice[1];
      break;
    case 6:
      text = lastTradePrice[2];
      break;

    case 8:
      text = lastTradePrice[3];
      break;
    case 10:
      text = lastTradePrice[4];
      break;
    default:
      return Container();
  }

  return SideTitleWidget(axisSide: meta.axisSide,
  // space: 10,
  child: Text(text, style: style, textAlign: TextAlign.center));
} 
