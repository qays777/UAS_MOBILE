import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:smart_garden/core.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;

class HumidityPage extends StatefulWidget {
  const HumidityPage({super.key});

  @override
  State<HumidityPage> createState() => _HumidityPageState();
}

class _HumidityPageState extends State<HumidityPage> {
  Map<String, double> dataMap = {
    "data1": 50,
    "data2": 50,
  };

  final List<ChartData> chartData = [];

  var humidityData = 0.0;

  Future<void> fetchHumidityData() async {
    final apiUrl = "https://planthouse-backend-qxjou66rkq-uc.a.run.app/humid1";

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final humidity = responseData['data']['humidity'];

        if (humidity is num) {
          setState(() {
            humidityData = humidity.toDouble();
            // Update PieChart dataMap
            dataMap = {
              "Humidity": humidityData,
              "Remaining": 100 - humidityData,
            };

            // Update the historical chartData list
            final timestamp = responseData['data']['timestamp'];
            chartData.add(ChartData(timestamp, humidity.round()));
          });
        } else {
          print("Invalid humidity data type: ${humidity.runtimeType}");
        }
      } else {
        print("Failed to fetch humidity data. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print("Error during API request: $error");
    }
  }
  
  Future<void> fetchHistoricalData() async {
    try {
      final historicalApiUrl = "http://0.0.0.0:8080/humid2";
      final historicalResponse = await http.get(Uri.parse(historicalApiUrl));

      if (historicalResponse.statusCode == 200) {
        final historicalData = json.decode(historicalResponse.body);
        final avgHumidity = historicalData['data']['avg_humidity'];
        final avgHumidityDate = historicalData['data']['date'];

        if (avgHumidity is num) {
          setState(() {
            // Add historical data as a single point to chartData
            chartData.add(ChartData(avgHumidityDate, avgHumidity.round()));
          });
        } else {
          print("Invalid average humidity data type: ${avgHumidity.runtimeType}");
        }
      } else {
        print("Failed to fetch historical humidity data. Status code: ${historicalResponse.statusCode}");
      }
    } catch (error) {
      print("Error during historical data request: $error");
    }
  }


  Timer? _timer; // Declare the Timer variable

  @override
  void initState() {
    super.initState();
    fetchHumidityData();
    fetchHistoricalData(); // Fetch historical data

    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      print("Timer callback executed");
      fetchHumidityData();
    });
  }

@override
void dispose() {
  print("Dispose method called");
  // Cancel the timer when the widget is disposed
  _timer?.cancel();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Humidity",
            style: greenTextColor.copyWith(
              fontSize: 24,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            "Environment Humidity Plants",
            style: greenTextColor.copyWith(
              fontSize: 14,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Center(
            child: PieChart(
              dataMap: dataMap,
              chartRadius: MediaQuery.of(context).size.width / 1.7,
              legendOptions: const LegendOptions(
                showLegends: false,
              ),
              chartValuesOptions: ChartValuesOptions(
                showChartValues: true,
                showChartValueBackground: false,
                showChartValuesInPercentage: true,
                chartValueStyle: TextStyle(fontSize: 24, fontWeight: bold),
              ),
              colorList: [
                Color.fromARGB(255, 26, 75, 110),
                piechartColor2,
              ],
              ringStrokeWidth: 30,
              baseChartColor: greyColor,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Center(
            child: Text(
              "${humidityData.toStringAsFixed(1)}% Rh",
              style: greenTextColor.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
          ),

          const SizedBox(
            height: 14,
          ),
          Text(
            "History",
            style: greenTextColor.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          Expanded(
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              series: <ChartSeries>[
                StackedColumnSeries<ChartData, String>(
                  color: greenColor,
                  dataSource: chartData,
                  xValueMapper: (ChartData ch, _) => ch.x,
                  yValueMapper: (ChartData ch, _) => ch.y,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ChartData {
  final String x;
  final int y;
  ChartData(
    this.x,
    this.y,
  );
}
