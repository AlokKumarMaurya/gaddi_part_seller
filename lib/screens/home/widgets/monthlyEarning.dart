import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MonthlyEarning extends StatelessWidget {
  MonthlyEarning({Key? key}) : super(key: key);
  final _dateTextStyle = const TextStyle(
    fontSize: 10,
    color: Colors.purple,
    fontWeight: FontWeight.bold,
  );

  List<BarChartGroupData> rawBarGroups = [];
  List<BarChartGroupData> showingBarGroups = [
    makeGroupData(0,1, 606),
    makeGroupData(1, 2, 80),
    makeGroupData(2, 2, 00),
    makeGroupData(3, 2, 800),
    makeGroupData(4, 2, 00),
    makeGroupData(5, 2, 300),
    makeGroupData(6, 2, 00),
    makeGroupData(7, 2, 100),
    makeGroupData(8, 2, 00),
    makeGroupData(9, 2, 580),
    makeGroupData(10, 2, 00),
    makeGroupData(11, 2, 80),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          "Monthly Earning",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 15,),
           Row(
             children: [
               Container(
                 height: 20,
                 width: 15,
                 decoration: const BoxDecoration(
                   shape: BoxShape.circle,
                   color: Colors.blue
                 ),
               ) ,
               const Text("Your Earning")
             ],
           )  ,
            Row(
              children: [
                Container(
                  height: 20,
                  width: 15,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red
                  ),
                ) ,
                const Text("Commission Given")
              ],
            ) ,
            const SizedBox(width: 15,)
          ],
        ) ,
        const SizedBox(height: 15,),
        Container(
          height: 300,
          child: BarChart(BarChartData(
            maxY: 1000,
            barTouchData: BarTouchData(
              touchTooltipData: BarTouchTooltipData(
                tooltipBgColor: Colors.grey,
                getTooltipItem: (a, b, c, d) => null,
              ),
            ),
            titlesData: FlTitlesData(
              show: true,
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                showTitles: true,

                // getTextStyles: (context, value) => const TextStyle(
                //     color: Color(0xff7589a2), fontWeight: FontWeight.w400, fontSize: 10),
                // margin: 10,
                getTitlesWidget: (double value, TitleMeta meta) {
                  switch (value.toInt()) {
                    case 0:
                      return SideTitleWidget(
                        axisSide: meta.axisSide,
                        space: 4,
                        child: Text("Jan", style: _dateTextStyle),
                      );
                    case 1:
                      return SideTitleWidget(
                        axisSide: meta.axisSide,
                        space: 4,
                        child: Text("Feb", style: _dateTextStyle),
                      );
                    case 2:
                      return SideTitleWidget(
                        axisSide: meta.axisSide,
                        space: 4,
                        child: Text("Mar", style: _dateTextStyle),
                      );
                    case 3:
                      return SideTitleWidget(
                        axisSide: meta.axisSide,
                        space: 4,
                        child: Text("Apr", style: _dateTextStyle),
                      );
                    case 4:
                      return SideTitleWidget(
                        axisSide: meta.axisSide,
                        space: 4,
                        child: Text("May", style: _dateTextStyle),
                      );
                    case 5:
                      return SideTitleWidget(
                        axisSide: meta.axisSide,
                        space: 4,
                        child: Text("Jun", style: _dateTextStyle),
                      );
                    case 6:
                      return SideTitleWidget(
                        axisSide: meta.axisSide,
                        space: 4,
                        child: Text("Jul", style: _dateTextStyle),
                      );
                    case 7:
                      return SideTitleWidget(
                        axisSide: meta.axisSide,
                        space: 4,
                        child: Text("Aug", style: _dateTextStyle),
                      );
                    case 8:
                      return SideTitleWidget(
                        axisSide: meta.axisSide,
                        space: 4,
                        child: Text("Sep", style: _dateTextStyle),
                      );
                    case 9:
                      return SideTitleWidget(
                        axisSide: meta.axisSide,
                        space: 4,
                        child: Text("Oct", style: _dateTextStyle),
                      );
                    case 10:
                      return SideTitleWidget(
                        axisSide: meta.axisSide,
                        space: 4,
                        child: Text("Nov", style: _dateTextStyle),
                      );
                    case 11:
                      return SideTitleWidget(
                        axisSide: meta.axisSide,
                        space: 4,
                        child: Text("Dec", style: _dateTextStyle),
                      );
                    default:
                      return SideTitleWidget(
                        axisSide: meta.axisSide,
                        space: 4,
                        child: Text("dfffd", style: _dateTextStyle),
                      );
                  }
                },
              )),
            ),
            borderData: FlBorderData(
              border: const Border(
                  bottom: BorderSide(color: Colors.black),
                  left: BorderSide(color: Colors.black)),
            ),
            gridData: FlGridData(show: true),
            barGroups: showingBarGroups,
          )),
        )
      ],
    );
  }
}

BarChartGroupData makeGroupData(int x, double y1, double y2) {
  return BarChartGroupData(barsSpace: 0, x: x, barRods: [
    BarChartRodData(
      toY: y1,
      // colors: [leftBarColor],
      width: 0,
    ),
    BarChartRodData(
      toY: y2,
      // colors: [rightBarColor],
      width: 5,
    ),
  ]);
}
