import 'package:flutter/material.dart';
import 'package:smart_garden/core.dart';

class PlantPageTabBar extends StatefulWidget {
  const PlantPageTabBar({Key? key}) : super(key: key);

  @override
  _PlantPageTabBarState createState() => _PlantPageTabBarState();
}

class _PlantPageTabBarState extends State<PlantPageTabBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void showNotif() {
    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            content: Container(
              width: 327,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  color: whiteColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 142,
                    height: 145,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/img_notif.png",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "Notification is ON",
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ),
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeView()),
                        );
                      },
                      child: Container(
                        width: 22,
                        height: 19,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                          "assets/images/ic_arrow_left.png",
                        ))),
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => showNotif(),
                          child: Container(
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
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SettingplantpageView()),
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
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/img_Peperomia_Obtusfolia.png",
                      width: 52.0,
                      height: 67.0,
                    ),
                    Text(
                      "Hey User",
                      style: greenTextColor.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                      ),
                    ),
                    Text(
                      "Care And Protect Your Plants ",
                      style: greenTextColor.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                Container(
                  // height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 533, 56, 74),
                      borderRadius: BorderRadius.circular(28)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: TabBar(
                          unselectedLabelColor: Colors.white,
                          labelColor: whiteColor,
                          indicatorColor: Colors.white,
                          indicatorWeight: 0,
                          indicator: BoxDecoration(
                            color: Color.fromARGB(255, 533, 56, 74),
                            borderRadius: BorderRadius.circular(26),
                          ),
                          controller: tabController,
                          tabs: const [
                            Tab(
                              text: 'Your Plant',
                            ),
                            Tab(
                              text: 'History Water',
                            ),
                            Tab(
                              text: 'Plants Status',
                            ),
                          ],
                          labelStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          unselectedLabelStyle: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: const [
                      PlantPageView(),
                      HistorywaterpageView(),
                      DetailhistorywaterpageitemView(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
