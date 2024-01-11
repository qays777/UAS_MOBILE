import 'package:flutter/material.dart';
import 'package:smart_garden/shared/theme.dart';

class TabBarItemPage extends StatelessWidget {
  final String itemSelect;

  const TabBarItemPage({super.key, required this.itemSelect});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 47,
      decoration: BoxDecoration(
        color: greenColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(28),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              width: 139,
              height: 34,
              decoration: BoxDecoration(
                color: rectangleColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(26),
                ),
              ),
              child: Align(
                child: Text(
                  itemSelect,
                  textAlign: TextAlign.center,
                  style: whiteTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "Fruit Plants",
              style: whiteTextStyle.copyWith(
                fontSize: 14,
                fontWeight: semiBold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
