import 'package:covid_19/View/countries_list.dart';
import 'package:covid_19/model/world_state_model.dart';
import 'package:covid_19/services/world_state_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
            FutureBuilder(
                future: WorldSateServices.fetchWorldStateData(),
                builder: (context, AsyncSnapshot<WorldStateModel> snapshot) {
                  if (!snapshot.hasData) {
                    return const Expanded(
                      flex: 1,
                      child: SpinKitWanderingCubes(
                        color: Colors.white,
                      ),
                    );
                  } else {
                    return Column(
                      children: [
                        PieChart(
                          dataMap: {
                            'Total':
                                double.parse(snapshot.data!.cases.toString()),
                            'Recovered': double.parse(
                                snapshot.data!.recovered.toString()),
                            'Death':
                                double.parse(snapshot.data!.deaths.toString())
                          },
                          animationDuration: const Duration(milliseconds: 1500),
                          chartRadius: 120,
                          chartValuesOptions: const ChartValuesOptions(
                            showChartValuesInPercentage: true,
                          ),
                          chartType: ChartType.ring,
                          legendOptions: const LegendOptions(
                              legendPosition: LegendPosition.left),
                        ),
                        const SizedBox(height: 60),
                        Card(
                          child: Column(
                            children: [
                              ReusableRow(
                                title: "Total",
                                value: double.parse(
                                    snapshot.data!.cases.toString()),
                              ),
                              ReusableRow(
                                  title: "Deaths",
                                  value: double.parse(
                                      snapshot.data!.deaths.toString())),
                              ReusableRow(
                                  title: "Recovered",
                                  value: double.parse(
                                      snapshot.data!.recovered.toString())),
                              ReusableRow(
                                  title: "Active",
                                  value: double.parse(
                                      snapshot.data!.active.toString())),
                              ReusableRow(
                                  title: "Critical",
                                  value: double.parse(
                                      snapshot.data!.cases.toString())),
                              ReusableRow(
                                  title: "Today Deaths",
                                  value: double.parse(
                                      snapshot.data!.todayDeaths.toString())),
                              ReusableRow(
                                  title: "Today Recovered",
                                  value: double.parse(snapshot
                                      .data!.todayRecovered
                                      .toString())),
                              ReusableRow(
                                  title: "Critical",
                                  value: double.parse(
                                      snapshot.data!.critical.toString()))
                            ],
                          ),
                        ),
                        const SizedBox(height: 80),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        const CountriesListScreen()));
                          },
                          child: Container(
                            height: 45,
                            width: double.infinity,
                            color: Colors.green,
                            child: const Center(child: Text("Track Countries")),
                          ),
                        )
                      ],
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
