import 'package:flutter/material.dart';

import '../../../shared/theme.dart';
import '../../detailhistorywaterpageitem/view/detailhistorywaterpageitem_view.dart';
import '../../settingplantpage/view/settingplantpage_view.dart';
import '../widget/detailhistorywaterpage_item.dart';

class DetailhistorywaterpageView extends StatefulWidget {
  const DetailhistorywaterpageView({super.key});

  @override
  State<DetailhistorywaterpageView> createState() =>
      _DetailhistorywaterpageViewState();
}

class _DetailhistorywaterpageViewState
    extends State<DetailhistorywaterpageView> {
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 21),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 21),
            children: [
              Text(
                "Your Plant",
                style: greenTextColor.copyWith(
                  fontWeight: semiBold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Container(
                width: 320,
                height: 270,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/img_houseplant2.png",
                      ),
                      fit: BoxFit.contain),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 35, 83, 108),
                      Color.fromARGB(255, 35, 83, 108)
                    ], // Ganti kode warna sesuai keinginan Anda
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const DetailhistorywaterpageitemView()),
                  );
                },
                child: Text(
                  "Seledri Plants",
                  style: greenTextColor.copyWith(
                    fontWeight: bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Cilantro (Coriandrum sativum), also known as coriander or coriander leaves, is a popular herb that can be grown using hydroponics. Hydroponic cilantro is known for its fresh and aromatic leaves, which are commonly used in culinary dishes for their unique flavor.",
                textAlign: TextAlign.justify,
                style: greenTextColor.copyWith(
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Expanded(
                child:
                    ListView(scrollDirection: Axis.horizontal, children: const [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DetailHistorywaterPageItem(
                          imageUrl: "assets/images/ic_water_outline.png",
                          title: "Water",
                          subtitle: "1 / 3 Week"),
                      DetailHistorywaterPageItem(
                          imageUrl: "assets/images/ic_water_outline.png",
                          title: "Light",
                          subtitle: "Medium"),
                      DetailHistorywaterPageItem(
                          imageUrl: "assets/images/ic_temperature.png",
                          title: "Temperature",
                          subtitle: "20˚C")
                    ],
                  ),
                ]),
              ),
            ],
          ),
        ));
  }
}
