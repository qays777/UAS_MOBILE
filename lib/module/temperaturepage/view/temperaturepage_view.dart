import 'dart:convert';
import 'dart:async'; // Tambahkan impor ini
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Smart Garden App'),
        ),
        body: TemperaturPage(),
      ),
    );
  }
}

class TemperaturPage extends StatefulWidget {
  const TemperaturPage({Key? key}) : super(key: key);

  @override
  State<TemperaturPage> createState() => _TemperaturPageState();
}

class _TemperaturPageState extends State<TemperaturPage> {
  double roomTemperature = 0.0; // Initialize with a default value
  late Timer _timer;

  // Function to fetch data from the API
  Future<void> fetchTemperatureData() async {
    final apiUrl = "https://planthouse-backend-qxjou66rkq-uc.a.run.app/temp1";

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final temperatureData = responseData['data']['temperature'];
  
        if (temperatureData is int) {
          setState(() {
            roomTemperature = temperatureData.toDouble();
          });
        } else if (temperatureData is double) {
          setState(() {
            roomTemperature = temperatureData;
          });
        } else {
          print("Invalid temperature data type: ${temperatureData.runtimeType}");
        }
      } else {
        print("Failed to fetch temperature data. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print("Error during API request: $error");
    }
  }

  @override
  void initState() {
    super.initState();
    // Call the function to fetch temperature data when the widget is created
    fetchTemperatureData();

    // Set up a periodic timer to fetch data every 3 seconds
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      fetchTemperatureData();
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Temperature",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Control Your Plants With Temperature",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 23,
          ),
          Center(
            child: Container(
              width: 195,
              height: 191,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/img_Exclude.png",
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Now",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "${roomTemperature.toStringAsFixed(1)}˚C",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Align(
            child: Text(
              "Time: ${DateTime.now().toString()}", // Display current time
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
