// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../shared/theme.dart';

class DetailHistoryWaterPageitemItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  const DetailHistoryWaterPageitemItem({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageUrl,
          width: 24.0,
          height: 24.0,
          color: greyItemTextColor,
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:
                  greyTextYoungColor.copyWith(fontSize: 12, fontWeight: bold),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              subtitle,
              style: whiteTextStyle.copyWith(fontSize: 12, fontWeight: bold),
            ),
          ],
        )
      ],
    );
  }
}
