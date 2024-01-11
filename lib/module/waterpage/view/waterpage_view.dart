import 'package:flutter/material.dart';
import 'package:smart_garden/core.dart';

class WaterPage extends StatelessWidget {
  const WaterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Water Today",
            style: greenTextColor.copyWith(
              fontSize: 24,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Care Your Plant  Give Water ",
                style: greenTextColor.copyWith(
                  fontSize: 14,
                  fontWeight: medium,
                ),
              ),
              Text(
                "4 Plants",
                style: greenTextYoungColor.copyWith(
                  fontSize: 14,
                  fontWeight: medium,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 22,
          ),
          WaterItem(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const Detailwater2View()),
              );
            },
            childIconUrl: "assets/images/ic_cup.png",
            title: "Seledri Plant",
            subtitle: "~ 250 ml",
            iconUrl: "assets/images/ic_water_outline.png",
            imageUrl: "assets/images/img_houseplant.png",
          ),
          WaterItem(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DetailwaterView()),
              );
            },
            childIconUrl: "assets/images/ic_cup.png",
            title: "Seledri Plant",
            subtitle: "~ 250 ml",
            iconUrl: "assets/images/ic_water_outline.png",
            imageUrl: "assets/images/img_houseplant.png",
          ),
          WaterItem(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DetailwaterView()),
              );
            },
            childIconUrl: "assets/images/ic_cup.png",
            title: "Seledri Plant",
            subtitle: "~ 250 ml",
            iconUrl: "assets/images/ic_water_outline.png",
            imageUrl: "assets/images/img_houseplant.png",
          ),
          WaterItem(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DetailwaterView()),
              );
            },
            childIconUrl: "assets/images/ic_cup.png",
            title: "Seledri Plant",
            subtitle: "~ 250 ml",
            iconUrl: "assets/images/ic_water_outline.png",
            imageUrl: "assets/images/img_houseplant.png",
          ),
        ],
      ),
    );
  }
}
