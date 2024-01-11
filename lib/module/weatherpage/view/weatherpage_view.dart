import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:smart_garden/core.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  Map<String, double> dataMap = {
    "data1": 50,
    "data2": 50,
  };

  final List<ChartData> chartData = [];

  var turbidityData = 0.0;


  Future<void> fetchturbidityData() async {
    final apiUrl = "https://planthouse-backend-qxjou66rkq-uc.a.run.app/turbid1";

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final turbidity = responseData['data']['turbidity'];

        if (turbidity is num) {
          setState(() {
            turbidityData = turbidity.toDouble();
            // Update PieChart dataMap
            dataMap = {
              "turbidity": turbidityData,
              "Remaining": 100 - turbidityData,
            };

            // Update the historical chartData list
            final timestamp = responseData['data']['timestamp'];
            chartData.add(ChartData(timestamp, turbidity.round()));
          });
        } else {
          print("Invalid turbidity data type: ${turbidity.runtimeType}");
        }
      } else {
        print("Failed to fetch turbidity data. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print("Error during API request: $error");
    }
  }


  Timer? _timer; // Declare the Timer variable

  @override
  void initState() {
    super.initState();
    // Call the function to fetch turbidity data when the widget is created
    fetchturbidityData();

_timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
  print("Timer callback executed");
  fetchturbidityData();
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
            "Turbidity",
            style: greenTextColor.copyWith(
              fontSize: 24,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            "Environment Turbidity Plants",
            style: greenTextColor.copyWith(
              fontSize: 14,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 21,
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
                piechartColor1,
              ],
              ringStrokeWidth: 30,
              baseChartColor: greyColor,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "${turbidityData}% Turbidity",
              style: greenTextColor.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "History",
            style: greenTextColor.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildHistoryItem("Today", "PH", "50%"),
                _buildHistoryItem("Yesterday", "PH", "30%"),
                _buildHistoryItem("Today", "PH", "50%"),
                _buildHistoryItem("Yesterday", "PH", "30%"),
                _buildHistoryItem("Today", "PH", "50%"),
                _buildHistoryItem("Yesterday", "PH", "30%"),
                _buildHistoryItem("Yesterday", "PH", "30%"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryItem(String day, String parameter, String value) {
    return Column(
      children: [
        Text(
          day,
          style: greenTextColor.copyWith(
            fontWeight: semiBold,
            fontSize: 12,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 45,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: greyColor,
              ),
            ),
          ),
          child: Row(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  parameter,
                  style: greenTextColor.copyWith(fontSize: 10),
                ),
              ),
              Container(
                width: 29,
                height: 23,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/ic_ph_plants.png",
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                value,
                style: greenTextColor.copyWith(
                  fontSize: 16,
                  fontWeight: bold,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              const Spacer(),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
