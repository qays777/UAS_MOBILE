import 'package:flutter/material.dart';
import 'package:smart_garden/core.dart';

class DetailHistorywaterPageItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  const DetailHistorywaterPageItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
          color: greyItemColor),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl,
              width: 13.0,
              height: 21.0,
              color: greyItemTextColor,
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: greyTextYoungColor.copyWith(
                      fontSize: 12, fontWeight: bold),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  subtitle,
                  style: greyTextYoungColor.copyWith(
                      fontSize: 12, fontWeight: bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
