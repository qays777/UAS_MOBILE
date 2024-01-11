import 'package:flutter/material.dart';
import 'package:smart_garden/core.dart';

class HomeTabbarPage extends StatefulWidget {
  const HomeTabbarPage({Key? key}) : super(key: key);

  @override
  _HomeTabbarPageState createState() => _HomeTabbarPageState();
}

class _HomeTabbarPageState extends State<HomeTabbarPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

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
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
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
                    const SizedBox(),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showNotif();
                          },
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
                const SizedBox(
                  height: 10,
                ),
                Container(
                  // height: 50,
                  width: MediaQuery.of(context).size.height,
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
                          indicatorWeight: 4,
                          indicator: BoxDecoration(
                            color: Color.fromARGB(0, 0, 0, 0),
                            borderRadius: BorderRadius.circular(26),
                          ),
                          controller: tabController,
                          tabs: const [
                            Tab(
                              text: 'Vegetables Plants',
                            ),
                            Tab(
                              text: 'Fruit Plants',
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
                const SizedBox(
                  height: 44,
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: const [
                      HomepageView(),
                      SizedBox(),
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
