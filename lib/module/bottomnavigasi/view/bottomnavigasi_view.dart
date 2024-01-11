import 'package:flutter/material.dart';
import 'package:smart_garden/core.dart';

class BottomnavigasiView extends StatefulWidget {
  const BottomnavigasiView({Key? key}) : super(key: key);

  Widget build(context, BottomnavigasiController controller) {
    controller.view = this;

    final List<Widget> screens = [
      const HomeTabbarPage(),
      const MenufiturView(),
      const DetailhistorywaterpageitemView(),
      const PlantPageTabBar(),
      const SettingpageView(),
    ];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        highlightElevation: 28, // Peningkatan ketinggian bayangan saat ditekan
        focusElevation:
            26, // Peningkatan ketinggian bayangan saat mendapatkan fokus
        hoverElevation: 26, // Peningkatan ketinggian bayangan saat dihover
        disabledElevation: 0, // Ketinggian bayangan saat tombol dinonaktifkan
        backgroundColor:     const   Color.fromARGB(255, 43, 100, 130),

                           
        onPressed: () {
          controller.ontap(2);
        },
        child: Image.asset(
          "assets/images/ic_leaf_fill.png",
          width: 32,
          height: 38,
          fit: BoxFit.fill,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: whiteColor,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 6,
        elevation: 0,
        child: BottomNavigationBar(
          onTap: controller.ontap,
          currentIndex: controller.currentIndex,
          backgroundColor: whiteColor,
          elevation: 10,
          type: BottomNavigationBarType.fixed,
          selectedItemColor:        Color.fromARGB(255, 35, 83, 108),

          unselectedItemColor: blackColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle:
              whiteTextStyle.copyWith(fontSize: 10, fontWeight: medium),
          unselectedLabelStyle:
              blackTextStyle.copyWith(fontSize: 10, fontWeight: medium),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/ic_home.png",
                width: 24, // Sesuaikan ukuran gambar sesuai kebutuhan
                height: 24,
              ),
              label: "",
              activeIcon: Image.asset(
                "assets/images/ic_home.png",
                width: 28, // Sesuaikan ukuran gambar sesuai kebutuhan
                height: 28,
                color: rectangleColor,
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/ic_explorer.png",
                width: 24, // Sesuaikan ukuran gambar sesuai kebutuhan
                height: 24,
              ),
              label: "",
              activeIcon: Image.asset(
                "assets/images/ic_explorer.png",
                width: 28, // Sesuaikan ukuran gambar sesuai kebutuhan
                height: 28,
                color:     Color.fromARGB(255, 35, 83, 108)
,
              ),
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "",
              activeIcon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/ic_chart.png",
                width: 24, // Sesuaikan ukuran gambar sesuai kebutuhan
                height: 24,
              ),
              label: "",
              activeIcon: Image.asset(
                "assets/images/ic_chart.png",
                width: 28, // Sesuaikan ukuran gambar sesuai kebutuhan
                height: 28,
                color: greenColor,
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/ic _calsett.png",
                width: 24, // Sesuaikan ukuran gambar sesuai kebutuhan
                height: 24,
              ),
              label: "",
              activeIcon: Image.asset(
                "assets/images/ic _calsett.png",
                width: 28, // Sesuaikan ukuran gambar sesuai kebutuhan
                height: 28,
                color:        Color.fromARGB(255, 35, 83, 108)
,
              ),
            ),
          ],
        ),
      ),
      body: screens[controller.currentIndex],
    );
  }

  @override
  State<BottomnavigasiView> createState() => BottomnavigasiController();
}
