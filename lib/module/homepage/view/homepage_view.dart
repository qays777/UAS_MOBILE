import 'package:flutter/material.dart';
import 'package:smart_garden/module/detailhistorywaterpage/view/detailhistorywaterpage_view.dart';

import '../../../shared/theme.dart';

class HomepageView extends StatefulWidget {
  const HomepageView({super.key});

  @override
  State<HomepageView> createState() => _HomepageViewState();
}

class _HomepageViewState extends State<HomepageView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // number of items in each row
        mainAxisSpacing: 56, // spacing between rows
        crossAxisSpacing: 15,
        childAspectRatio: 0.6, // spacing between columns
      ),
      padding: const EdgeInsets.all(8.0), // padding around the grid
      itemCount: 8, // total number of items
      itemBuilder: (context, index) {
        return Container(
          width: 150,
          height: 82,
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
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const DetailhistorywaterpageView()),
                        );
                      },
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
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
