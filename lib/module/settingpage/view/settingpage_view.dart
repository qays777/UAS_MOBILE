import 'package:flutter/material.dart';
import 'package:smart_garden/core.dart';

class SettingpageView extends StatefulWidget {
  const SettingpageView({super.key});

  @override
  State<SettingpageView> createState() => _SettingpageViewState();
}

class _SettingpageViewState extends State<SettingpageView> {
  bool isSwitched1 = false;
  bool isSwitched2 = false;
  bool isSwitched3 = false;
  bool isSwitched4 = false;
  bool isSwitched5 = false;
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
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 18,
          ),
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
                        child: GestureDetector(
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
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 17,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Settings Plants",
                      style: greenTextColor.copyWith(
                        fontSize: 24,
                        fontWeight: semiBold,
                      ),
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    Text(
                      "Water Days",
                      style: greyTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ReusableTodayItem(items: const [
                      {
                        "label": "Sun",
                        "value": "Sunday",
                      },
                      {
                        "label": "Mon",
                        "value": "Monday",
                      },
                      {
                        "label": "Tue",
                        "value": "Tuesday",
                      },
                      {
                        "label": "Wed",
                        "value": "Wednesday",
                      },
                      {
                        "label": "Thu",
                        "value": "Thursday",
                      },
                      {
                        "label": "Fri",
                        "value": "Friday",
                      },
                      {
                        "label": "Sat",
                        "value": "Saturday",
                      },
                    ], onChanged: (index, label, value, item) {}),
                    const SizedBox(
                      height: 27,
                    ),
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        border: Border.symmetric(
                          horizontal: BorderSide(
                            color: blackColor,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Set Reminders",
                            style: greyTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          Switch(
                            activeColor:Color.fromARGB(255, 533, 56, 74),
          
                            value: isSwitched1,
                            onChanged: (value) {
                              setState(() {
                                isSwitched1 = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: blackColor,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Day",
                            style: greyTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          Text(
                            "Water Day",
                            style: greyTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: blackColor,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Time",
                            style: greyTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          Text(
                            "09:20",
                            style: greyTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: blackColor,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Water Spraying",
                            style: greyTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          Switch(
                            activeColor:   Color.fromARGB(255, 533, 56, 74),
                            
                            value: isSwitched2,
                            onChanged: (value) {
                              setState(() {
                                isSwitched2 = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: blackColor,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Plant Food",
                            style: greyTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          Switch(
                            activeColor:   Color.fromARGB(255, 533, 56, 74),
                       
                            value: isSwitched3,
                            onChanged: (value) {
                              setState(() {
                                isSwitched3 = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: blackColor,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Leaves Cleaning",
                            style: greyTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          Switch(
                            activeColor:   Color.fromARGB(255, 533, 56, 74),
                            
                            value: isSwitched4,
                            onChanged: (value) {
                              setState(() {
                                isSwitched4 = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 55,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Plant Age",
                            style: greyTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          Switch(
                            activeColor:   Color.fromARGB(255, 533, 56, 74),
                         
                            value: isSwitched5,
                            onChanged: (value) {
                              setState(() {
                                isSwitched5 = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
