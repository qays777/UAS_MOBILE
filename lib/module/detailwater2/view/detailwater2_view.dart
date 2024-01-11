import 'package:flutter/material.dart';
import 'package:smart_garden/core.dart';

class Detailwater2View extends StatefulWidget {
  const Detailwater2View({super.key});

  @override
  State<Detailwater2View> createState() => _Detailwater2ViewState();
}

class _Detailwater2ViewState extends State<Detailwater2View> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: greenColor, size: 30),
        elevation: 0,
        backgroundColor: lightBackgroundColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                Container(
                  height: 24,
                  width: 24,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/ic_notification.png",
                      ),
                    ),
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/images/ic_ellipse.png",
                      width: 8.0,
                      height: 8.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingplantpageView()),
                    );
                  },
                  child: Container(
                    height: 24,
                    width: 24,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/ic_setting.png",
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Water My Plants",
                style: greenTextColor.copyWith(
                  fontSize: 24,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(
                height: 36,
              ),
              Center(
                child: Container(
                  width: 112,
                  height: 172,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                    "assets/images/img_detailwater2.png",
                  ))),
                ),
              ),
              const SizedBox(
                height: 23,
              ),
              Align(
                child: Text(
                  "Cilantro (Coriandrum sativum), also known as coriander or coriander leaves, is a popular herb that can be grown using hydroponics. Hydroponic cilantro is known for its fresh and aromatic leaves, which are commonly used in culinary dishes for their unique flavor.",
                  textAlign: TextAlign.justify,
                  style: greenTextColor.copyWith(fontSize: 14),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Center(
                child: Container(
                  width: 120,
                  height: 44,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                      color: Color.fromARGB(255, 35, 83, 108)),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/ic_cup.png",
                          width: 25.0,
                          height: 26.0,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          "~250 ml",
                          style: greyTextStyle.copyWith(
                            fontWeight: bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 42,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DetailwaterView()),
                  );
                },
                child: Center(
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 35, 83, 108),
                          Color.fromARGB(255, 35, 83, 108)
                        ], // Ganti kode warna sesuai keinginan Anda
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Image.asset(
                        "assets/images/ic_water_outline.png",
                        width: 48,
                        height: 48,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              Align(
                child: Text(
                  "Water Plants",
                  textAlign: TextAlign.center,
                  style: greenTextColor.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
