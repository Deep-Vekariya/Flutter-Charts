import 'package:charts/Charts/style.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'model/model.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  late List<ChartData> data;
  @override
  void initState() {
    super.initState();
    data = [
      ChartData(17, 21500),
      ChartData(18, 25300),
      ChartData(19, 23700),
      ChartData(20, 20340),
      ChartData(21, 25400),
      ChartData(22, 31000),
      ChartData(23, 28900),
      ChartData(24, 41570),
      ChartData(25, 31580),
      ChartData(26, 31230),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.bgcolor,
      appBar: AppBar(
        backgroundColor: AppStyle.bgcolor,
        elevation: 0,
        title: const Text("Bitcoin Price"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "BITCOIN",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          const CircleAvatar(
            backgroundImage: NetworkImage(
              "https://www.google.com/url?sa=i&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FBitcoin&psig=AOvVaw1cbLpF1uxHks1zzmSMohIM&ust=1693829281501000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCOibn_ezjoEDFQAAAAAdAAAAABAE",
            ),
            radius: 36,
          ),
          const SizedBox(height: 10),
          const Text(
            "(BTC)",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          Center(
            child: SfCartesianChart(
              margin: const EdgeInsets.all(0),
              borderWidth: 0,
              borderColor: Colors.transparent,
              plotAreaBorderWidth: 0,
              primaryXAxis: NumericAxis(
                minimum: 17,
                maximum: 26,
                interval: 1,
                isVisible: false,
                borderWidth: 0,
                borderColor: Colors.transparent,
              ),
              primaryYAxis: NumericAxis(
                minimum: 19000,
                maximum: 45000,
                interval: 1000,
                isVisible: false,
                borderWidth: 0,
                borderColor: Colors.transparent,
              ),
              series: <ChartSeries<ChartData, int>>[
                SplineAreaSeries(
                  dataSource: data,
                  xValueMapper: (ChartData data, _) => data.day,
                  yValueMapper: (ChartData data, _) => data.price,
                  splineType: SplineType.natural,
                  gradient: LinearGradient(
                    colors: [
                      AppStyle.splinecolor,
                      AppStyle.bgcolor,
                    ],
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                  ),
                ),
                SplineAreaSeries(
                  dataSource: data,
                  color: AppStyle.accentcolor,
                  borderWidth: 4,
                  markerSettings: MarkerSettings(
                    color: AppStyle.splinecolor,
                    borderWidth: 3,
                    shape: DataMarkerType.circle,
                    isVisible: true,
                    borderColor: AppStyle.accentcolor,
                  ),
                  xValueMapper: (ChartData data, _) => data.day,
                  yValueMapper: (ChartData data, _) => data.price,
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton.icon(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  side: BorderSide(
                    color: AppStyle.accentcolor,
                  ),
                ),
                icon: const Icon(
                  Icons.upload,
                  color: Colors.white,
                ),
                label: const Text(
                  "sell",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  backgroundColor: AppStyle.accentcolor,
                ),
                icon: const Icon(
                  Icons.download,
                  color: Colors.white,
                ),
                label: const Text(
                  "Buy",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
