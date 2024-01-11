import 'package:flutter/material.dart';

import '../../../shared/theme.dart';
import '../../home/view/home_view.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: ListView(children: [
          Column(
            children: [
              SizedBox(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 319,
                    height: 501,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 33, 58, 93),
                            Color.fromARGB(255, 33, 58, 93)
                          ], // Ganti kode warna sesuai keinginan Anda
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(35),
                            topLeft: Radius.circular(35))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 286,
                                  height: 314,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        "assets/images/img_onboarding1.png",
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  "Welcome to\nSmart Garden",
                                  style: whiteTextStyle.copyWith(
                                    fontWeight: bold,
                                    fontSize: 30,
                                  ),
                                ),
                                Text(
                                  "Feel Fresh a with plant Worlds.\nit will enhance your living space!",
                                  style: greyTextStyle.copyWith(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 6, 11, 21),
                                  Color.fromARGB(255, 35, 50, 87),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ).createShader(bounds);
                            },
                            child: const RotatedBox(
                              quarterTurns: 3,
                              child: Text(
                                "WATER WISE",
                                style: TextStyle(
                                  fontSize: 56,
                                  color: Colors.white, // Warna default teks
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeView()),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 68,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 33, 58, 93),
                          Color.fromARGB(255, 33, 58, 93)
                        ], // Ganti kode warna sesuai keinginan Anda
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      image: DecorationImage(
                        alignment: Alignment.centerLeft,
                        image: AssetImage(
                          "assets/images/img_btn_started.png",
                        ),
                      )),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 240,
                  height: 153,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 33, 58, 93),
                        Color.fromARGB(255, 33, 58, 93),
                      ], // Ganti kode warna sesuai keinginan Anda
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      topLeft: Radius.circular(35),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 138,
                        height: 120,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/img_onboarding2.png",
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 210,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/img_onboarding3.png",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
