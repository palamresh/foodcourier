import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class RevenueChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.all(4),
      height: h * .4 / 1.4,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
      child: Column(
        children: [
          SizedBox(
            height: h * .02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total Revenue",
                    style: TextStyle(
                        fontSize: h * .03 / 1.5,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "\$2,234",
                    style: TextStyle(
                        fontSize: h * .03, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              ElevatedButton.icon(
                onPressed: () {},
                label: const Text("Daily"),
                icon: const Icon(Icons.arrow_drop_down),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "See Details",
                    style: TextStyle(
                        fontSize: h * .03 / 1.4,
                        color: Colors.orange,
                        decorationColor: Colors.orange,
                        decoration: TextDecoration.underline),
                  ))
            ],
          ),
          SizedBox(
            height: h * .3 / 1.2,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: LineChart(
                LineChartData(
                  minX: 0,
                  maxX: 6,
                  minY: 1,
                  maxY: 6,
                  gridData: const FlGridData(show: false),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        interval: 1,
                        showTitles: true,
                        reservedSize: 24,
                        getTitlesWidget: (value, meta) {
                          const style = TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          );
                          Widget text;
                          switch (value.toInt()) {
                            case 0:
                              text = const Center(
                                  child: Text('10AM', style: style));
                              break;
                            case 1:
                              text = const Text('11AM', style: style);
                              break;
                            case 2:
                              text = const Text('12AM', style: style);
                              break;
                            case 3:
                              text = const Text('01PM', style: style);
                              break;
                            case 4:
                              text = const Text('02PM', style: style);
                              break;
                            case 5:
                              text = const Text('03PM', style: style);
                              break;
                            case 6:
                              text = const Text('04PM', style: style);
                              break;

                            default:
                              text = const Text('');
                              break;
                          }
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            space: 5,
                            child: text,
                          );
                        },
                      ),
                    ),
                    leftTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                  ),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        const FlSpot(0, 1),
                        const FlSpot(1, 3),
                        const FlSpot(2, 1.5),
                        const FlSpot(3, 4),
                        const FlSpot(4, 3.5),
                        const FlSpot(5, 4.8),
                        const FlSpot(6, 4),
                      ],
                      isCurved: true,
                      color: Colors.orange,
                      barWidth: 1,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(
                          //  show: true,
                          // dotSize: 6,
                          // dotColor: Colors.orange,
                          ),
                      belowBarData: BarAreaData(
                        show: true,
                        color: Colors.orange.withOpacity(0.1),
                      ),
                    ),
                  ],
                  lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                      // tooltipBgColor: Colors.black,
                      getTooltipItems: (List<LineBarSpot> touchedSpots) {
                        return touchedSpots.map((spot) {
                          return LineTooltipItem(
                            '\$${(spot.y * 500).toInt()}',
                            const TextStyle(color: Colors.white),
                          );
                        }).toList();
                      },
                    ),
                    touchCallback:
                        (FlTouchEvent event, LineTouchResponse? response) {},
                    handleBuiltInTouches: true,
                    touchSpotThreshold: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
