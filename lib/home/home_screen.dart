import 'package:flutter/material.dart';
import 'package:islami_application/app_colors.dart';
import 'package:islami_application/home/tabs/hadeth/hadeth_tab.dart';
import 'package:islami_application/home/tabs/quran/quran_tab.dart';
import 'package:islami_application/home/tabs/radio/radio_tab.dart';
import 'package:islami_application/home/tabs/sebha/sebha_tab.dart';
import 'package:islami_application/home/tabs/time/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> backgroundImages = [
    'assets/quran_bg.png',
    'assets/hadeth_bg.png',
    'assets/sebha_bg.png',
    'assets/radio_bg.png',
    'assets/time_bg.png',
  ];

  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(backgroundImages[selectedIndex],
            width: double.infinity, height: double.infinity, fit: BoxFit.fill),
        Scaffold(
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: AppColors.primaryDark,
            ),
            child: BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                items: [
                  BottomNavigationBarItem(
                      icon: builtItemInBottomNavBar(
                          index: 0, imageName: 'icon-quran'),
                      label: 'Quran'),
                  BottomNavigationBarItem(
                      icon: builtItemInBottomNavBar(
                          index: 1, imageName: 'icon_hadeth'),
                      label: 'Hadeth'),
                  BottomNavigationBarItem(
                      icon: builtItemInBottomNavBar(
                          index: 2, imageName: 'icon_sebha'),
                      label: 'Sebha'),
                  BottomNavigationBarItem(
                      icon: builtItemInBottomNavBar(
                          index: 3, imageName: 'icon_radio'),
                      label: 'Radio'),
                  BottomNavigationBarItem(
                      icon: builtItemInBottomNavBar(
                          index: 4, imageName: 'icon_time'),
                      label: 'Time'),
                ]),
          ),
          body: tabs[selectedIndex],
        ),
      ],
    );
  }

  Widget builtItemInBottomNavBar(
      {required int index, required String imageName}) {
    return selectedIndex == index
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 19),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(66),
                color: AppColors.blackBgColor),
            child: ImageIcon(
              AssetImage('assets/$imageName.png'),
            ))
        : ImageIcon(
            AssetImage('assets/$imageName.png'),
          );
  }
}
