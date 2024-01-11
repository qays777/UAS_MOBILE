import 'package:flutter/material.dart';

import '../../../shared/theme.dart';
import '../widget/detailhistorywaterpageitem_item.dart';

class DetailhistorywaterpageitemView extends StatefulWidget {
  const DetailhistorywaterpageitemView({super.key});

  @override
  State<DetailhistorywaterpageitemView> createState() =>
      _DetailhistorywaterpageitemViewState();
}

class _DetailhistorywaterpageitemViewState
    extends State<DetailhistorywaterpageitemView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Plants Status",
                style: greenTextColor.copyWith(
                  fontSize: 24,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      width: 314,
                      height: 306,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 533, 56, 74),
                            Color.fromARGB(255, 35, 83, 108)

                          ], // Ganti kode warna sesuai keinginan Anda
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 21, vertical: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Seledri\nPlants",
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 24,
                                    fontWeight: bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                const DetailHistoryWaterPageitemItem(
                                  imageUrl:
                                      "assets/images/ic_water_outline.png",
                                  title: "Water",
                                  subtitle: "1 / 3 Week",
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const DetailHistoryWaterPageitemItem(
                                  imageUrl: "assets/images/ic_light.png",
                                  title: "Light",
                                  subtitle: "Medium",
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const DetailHistoryWaterPageitemItem(
                                  imageUrl: "assets/images/ic_temperature.png",
                                  title: "Temperature",
                                  subtitle: "18-20˚C",
                                ),
                              ],
                            ),
                            Container(
                              height: 244,
                              width: 129,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/images/img_houseplant2.png",
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      width: 314,
                      height: 306,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                        gradient: LinearGradient(
                          colors: [
                           Color.fromARGB(255, 533, 56, 74),
                            Color.fromARGB(255, 35, 83, 108)
                          ], // Ganti kode warna sesuai keinginan Anda
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 21, vertical: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Bayam\nPlants",
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 24,
                                    fontWeight: bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                const DetailHistoryWaterPageitemItem(
                                  imageUrl:
                                      "assets/images/ic_water_outline.png",
                                  title: "Water",
                                  subtitle: "1 / 3 Week",
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const DetailHistoryWaterPageitemItem(
                                  imageUrl: "assets/images/ic_light.png",
                                  title: "Light",
                                  subtitle: "Medium",
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const DetailHistoryWaterPageitemItem(
                                  imageUrl: "assets/images/ic_temperature.png",
                                  title: "Temperature",
                                  subtitle: "18-20˚C",
                                ),
                              ],
                            ),
                            Container(
                              height: 244,
                              width: 129,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/images/img_houseplant2.png",
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
