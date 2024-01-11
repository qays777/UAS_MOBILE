import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../shared/theme.dart';
import '../../detailhistorywaterpage/view/detailhistorywaterpage_view.dart';

class HistorywaterpageView extends StatefulWidget {
  const HistorywaterpageView({super.key});

  @override
  State<HistorywaterpageView> createState() => _HistorywaterpageViewState();
}

class _HistorywaterpageViewState extends State<HistorywaterpageView> {
  String waterStatus = "air_jernih";

  Future<void> fetchWaterStatus() async {
    final apiUrl = "https://planthouse-backend-qxjou66rkq-uc.a.run.app/getWaterStatus";

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final status = responseData['data']['waterStatus'];

        setState(() {
          waterStatus = status;
        });
      } else {
        print("Failed to fetch water status. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print("Error during API request: $error");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWaterStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: Column(
        children: [
          Container(
            height: 56,
            margin: const EdgeInsets.only(top: 14),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(12.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/ic_clock.png",
                        width: 18.0,
                        height: 19.0,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      Text(
                        "Replacing Plant Water Filters",
                        style: greenTextColor.copyWith(fontWeight: semiBold, fontSize: 14),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/ic_seedling.png",
                        width: 18.0,
                        height: .0,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      Text(
                        "Hidroponic Plants",
                        style: greenTextColor.copyWith(fontWeight: semiBold, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 13,
              physics: const ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DetailhistorywaterpageView()),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 18),
                    width: 324,
                    height: 83,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 59,
                            height: 90,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/img_houseplant.png"),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Tanaman Bayam",
                                style: greenTextColor.copyWith(fontWeight: semiBold, fontSize: 14),
                              ),
                              Text(
                                waterStatus == "air_jernih" ? "Water Has Been Changed" : "Water Hasn't Changed",
                                style: greyTextStyle.copyWith(fontWeight: medium),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 18, right: 34),
                            height: 20,
                            width: 20,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/img_frame.png"))),
                          ),
                          Expanded(
                            child: Text(
                              waterStatus == "air_jernih" ? "Turbid" : "Not Turbid",
                              textAlign: TextAlign.end,
                              style: greenTextColor.copyWith(fontWeight: medium),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}