import 'package:flutter/material.dart';
import 'package:smart_garden/shared/theme.dart';

class WaterItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String iconUrl;
  final String imageUrl;
  final String childIconUrl;
  final double? width;
  final VoidCallback? onTap;
  const WaterItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconUrl,
    required this.imageUrl,
    required this.childIconUrl,
    this.width = 59,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 18),
        width: 324,
        height: 83,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 44, 80, 110),
          borderRadius: const BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Container(
                width: 59,
                height: 90,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      imageUrl,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 24,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: whiteTextStyle.copyWith(
                        fontWeight: bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          childIconUrl,
                          width: 15,
                          height: 13,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          subtitle,
                          style: whiteTextStyle.copyWith(
                            fontWeight: medium,
                            fontSize: 8,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
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
                  padding: const EdgeInsets.all(6),
                  child: Image.asset(
                    iconUrl,
                    width: width,
                    height: 54,
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
