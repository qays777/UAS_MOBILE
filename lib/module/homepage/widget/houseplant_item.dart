import 'package:flutter/material.dart';
import 'package:smart_garden/shared/theme.dart';

class HouseplantItem extends StatelessWidget {
  const HouseplantItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 242,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.asset(
                "assets/images/img_houseplant.png",
                width: 102,
                height: 158,
              )),
          const SizedBox(
            height: 21,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "Seledri\nPlants",
                  style: greenTextYoungColor.copyWith(
                    fontSize: 12,
                    fontWeight: semiBold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  width: 28,
                  height: 27,
                  decoration: BoxDecoration(
                    color: greenColor,
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      image: AssetImage(
                        "assets/images/ic_arrow-right.png",
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
