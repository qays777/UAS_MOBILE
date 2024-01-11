import 'package:flutter/material.dart';
import 'package:smart_garden/shared/theme.dart';

class MenuFiturItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String iconUrl;
  final String imageUrl;
  final double width;
  final VoidCallback? onTap;

  const MenuFiturItem(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.iconUrl,
      required this.imageUrl,
      required this.width,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 324,
        height: 83,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 44, 80, 110),
              Color.fromARGB(255, 46, 78, 114)
            ], // Ganti kode warna sesuai keinginan Anda
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 45,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                     Color.fromARGB(255, 29, 61, 68),
                      Color.fromARGB(255, 46, 78, 114)
                    ], // Ganti kode warna sesuai keinginan Anda
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(
                    iconUrl,
                    width: width,
                    height: 54,
                  ),
                ),
              ),
              const SizedBox(
                width: 24,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: whiteTextStyle.copyWith(
                        fontWeight: bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: whiteTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(
                imageUrl,
                width: 52,
                height: 67,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
