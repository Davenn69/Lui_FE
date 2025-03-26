import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lui_fe/features/statistic/presentation/widgets/statistic_widgets.dart';

class StatisticScreen extends ConsumerStatefulWidget{
  const StatisticScreen({super.key});

  @override
  ConsumerState<StatisticScreen> createState() => StatisticScreenState();
}

class StatisticScreenState extends ConsumerState<StatisticScreen>{

  List<bool> isSelected = [false, false, false, false];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text("Statistic", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                SizedBox(height: 20),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ToggleButtons(
                          borderRadius: BorderRadius.circular(8),
                            borderWidth: 0,
                            fillColor: Color(0xFF429690),
                            selectedColor: Colors.white,
                            isSelected: isSelected,
                            children: [
                              Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Text("Day")),
                              Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Text("Week")),
                              Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Text("Month")),
                              Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Text("Year")),
                            ],
                          onPressed: (int index){
                            setState(() {
                              isSelected = [false, false, false, false];
                              isSelected[index] = !isSelected[index];
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal : 30.0),
                    child: SizedBox(
                      height: 200,
                      width: 350,
                      child: LineChart(
                        LineChartData(
                          minX: 0,
                          maxX: 11,
                          minY: 0,
                          maxY: 4,
                          titlesData: FlTitlesData(
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: false
                              )
                            ),
                            rightTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: false
                              )
                            ),
                            topTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: false
                              )
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                interval: 3,
                                getTitlesWidget: (value, meta){
                                  switch(value.toInt()){
                                    case 0:
                                      return Text("Jan");
                                    case 1:
                                      return Text("Feb");
                                    case 2:
                                      return Text("Mar");
                                    case 3:
                                      return Text("Apr");
                                    case 4:
                                      return Text("May");
                                    case 5:
                                      return Text("Jun");
                                    case 6:
                                      return Text("Jul");
                                    case 7:
                                      return Text("Aug");
                                    case 8:
                                      return Text("Sep");
                                    case 9:
                                      return Text("Oct");
                                    case 10:
                                      return Text("Nov");
                                    case 11:
                                      return Text("Des");
                                    default:
                                      return Text("");
                                  }
                                }
                              )
                            )
                          ),
                          gridData: FlGridData(show: false),
                          borderData: FlBorderData(show: false),
                          lineBarsData: [
                            LineChartBarData(
                              spots: const [
                                FlSpot(0, 1),
                                FlSpot(1, 2),
                                FlSpot(2, 1.2),
                                FlSpot(3, 2.8),
                                FlSpot(4, 1.5),
                                FlSpot(5, 2.3),
                                FlSpot(6, 1),
                                FlSpot(7, 2),
                                FlSpot(8, 1.2),
                                FlSpot(9, 2.8),
                                FlSpot(10, 1.5),
                                FlSpot(11, 2.3),
                              ],
                              isCurved: true,
                              color: Color(0xFF2A7C76),
                              barWidth: 3,
                              belowBarData: BarAreaData(
                                show: true,
                                color: Color(0xFF2A7C76).withAlpha(20)
                              ),
                              dotData: FlDotData(show: false)
                            )
                          ]
                        )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "Top Spending",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),
                      ),
                      Icon(Icons.change_circle)
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      topSpendingCard("Starbucks", "Jan 12, 2022", 150, "expense"),
                      topSpendingCard("Transfer", "Yesterday", 85, "income"),
                      topSpendingCard("Youtube", "Jan 16, 2022", 11, "expense"),
                      topSpendingCard("Starbucks", "Jan 12, 2022", 150, "expense"),
                      topSpendingCard("Transfer", "Yesterday", 85, "income"),
                      topSpendingCard("Youtube", "Jan 16, 2022", 11, "expense"),
                    ],
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}