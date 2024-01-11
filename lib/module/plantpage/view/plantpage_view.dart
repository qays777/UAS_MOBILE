import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smart_garden/shared/theme.dart';

class PlantPageView extends StatefulWidget {
  const PlantPageView({super.key});

  @override
  State<PlantPageView> createState() => _PlantPageViewState();
}

class _PlantPageViewState extends State<PlantPageView> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  final List<Widget> data = [
    Container(
      width: 106,
      height: 210,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/img_houseplant3.png",
          ),
        ),
      ),
    ),
    Container(
      width: 106,
      height: 210,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/img_houseplant3.png",
          ),
        ),
      ),
    ),
    Container(
      width: 106,
      height: 210,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/img_houseplant3.png",
          ),
        ),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightBackgroundColor,
        body: Container(
          margin: const EdgeInsets.only(top: 14),
          width: 341,
          height: 378,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(18.0),
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 18),
                width: 35,
                height: 5,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  color: Color.fromARGB(255, 533, 56, 74),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              CarouselSlider(
                items: data,
                carouselController: _controller,
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                  viewportFraction: 0.5, // Sesuaikan nilai sesuai kebutuhan
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: data.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Seledri Plants",
                style: greenTextColor.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(
                height: 34,
              ),
              Container(
                width: 219,
                height: 50,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2), // Warna bayangan
                      spreadRadius: 1, // Seberapa merata bayangan disebarkan
                      blurRadius: 3, // Seberapa kabur bayangan
                      offset: const Offset(0,
                          3), // Perpindahan bayangan secara horizontal dan vertikal
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 34,
                        height: 32,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/ic_temperature-half.png",
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "23°c",
                        style: greenTextColor.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                        ),
                      ),
                      Container(
                        width: 16,
                        height: 13,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/ic_check.png",
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 50,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/ic_divider.png",
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 28,
                        height: 17,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/ic_water_green.png",
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "85%",
                        style: greenTextColor.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                        ),
                      ),
                      Container(
                        width: 16,
                        height: 13,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/ic_check.png",
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
        ));
  }
}
