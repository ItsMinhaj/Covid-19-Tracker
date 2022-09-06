import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import '../widgets/resuable_row.dart';

class WorldsCurrentState extends StatefulWidget {
  const WorldsCurrentState({Key? key}) : super(key: key);

  @override
  State<WorldsCurrentState> createState() => _WorldsCurrentStateState();
}

class _WorldsCurrentStateState extends State<WorldsCurrentState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const PieChart(
              dataMap: {'Total': 15, 'Recovered': 8, 'Death': 35},
              animationDuration: Duration(milliseconds: 1500),
              chartRadius: 100,
              chartType: ChartType.ring,
              legendOptions: LegendOptions(legendPosition: LegendPosition.left),
            ),
            const SizedBox(height: 60),
            Card(
              child: Column(
                children: const [
                  ReusableRow(title: "Total", value: 20),
                  ReusableRow(title: "Total", value: 20),
                  ReusableRow(title: "Total", value: 20),
                  ReusableRow(title: "Total", value: 20),
                  ReusableRow(title: "Total", value: 20)
                ],
              ),
            ),
            const SizedBox(height: 80),
            Container(
              height: 45,
              width: double.infinity,
              color: Colors.green,
              child: const Center(child: Text("Track Countries")),
            )
          ],
        ),
      ),
    );
  }
}
