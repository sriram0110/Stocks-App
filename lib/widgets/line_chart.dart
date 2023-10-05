import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stocks_app/widgets/line_titles.dart';

class LineChartWidget extends StatelessWidget {
  LineChartWidget({super.key});

  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 11,
        minY: 0,
        maxY: 6,
        titlesData: LineTitles.getTitleData(),
        gridData: FlGridData(
          show: true,
          getDrawingHorizontalLine: (value) {
            return const FlLine(
              color: Color(0xff37434d),
              strokeWidth: 1,
            );
          },
          drawVerticalLine: true,
          getDrawingVerticalLine: (value) {
            return const FlLine(
              color: Color(0xff37434d),
            );
          },
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 2.0),
        ),
        lineBarsData: [ 
          LineChartBarData(
              spots: [
                const FlSpot(0, 3),
                const FlSpot(1, 6),
                const FlSpot(2, 4),
                const FlSpot(4.5, 2),
                const FlSpot(8, 4),
                const FlSpot(10, 5),
              ],
              isCurved: true,
              gradient: LinearGradient(colors: gradientColors),
              barWidth: 3,
              // dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: gradientColors
                      .map(
                        (color) => color.withOpacity(0.1),
                      )
                      .toList(),
                ),
              )),
        ],
      ),
    );
  }
}
