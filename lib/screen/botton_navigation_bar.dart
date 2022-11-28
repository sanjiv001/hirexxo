import 'package:flutter/material.dart';
import 'package:hirexxo/screen/dashboard_sceen.dart';
import 'package:hirexxo/screen/explore.dart';
import 'package:hirexxo/theme/color.dart';
import 'package:hirexxo/widgets/bottombar_item.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;
  List barItems = [
    {
      "icon": Icons.home_outlined,
      "active_icon": Icons.home_rounded,
      "page": HomePage(),
      "title": ""
    },
    {
      "icon": Icons.search_outlined,
      "active_icon": Icons.search,
      "page": ExplorePage(),
      "title": ""
    },
    {
      "icon": Icons.add,
      "active_icon": Icons.add_card_rounded,
      "page": HomePage(),
      "title": ""
    },
    {
      "icon": Icons.favorite_border,
      "active_icon": Icons.favorite_outlined,
      "page": HomePage(),
      "title": ""
    },
    {
      "icon": Icons.forum_outlined,
      "active_icon": Icons.forum_rounded,
      "page": HomePage(),
      "title": ""
    },
    {
      "icon": Icons.settings_outlined,
      "active_icon": Icons.settings_rounded,
      "page": Drawer(),
      "title": ""
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: getBarPage(),
      // bottomNavigationBar: getBottomBar1()
      floatingActionButton: getBottomBar(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  Widget getBarPage() {
    return IndexedStack(
        index: activeTab,
        children:
            List.generate(barItems.length, (index) => barItems[index]["page"]));
  }

  Widget getBottomBar() {
    return Container(
      height: 55,
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
      decoration: BoxDecoration(
          color: bottomBarColor,
          borderRadius: BorderRadius.circular(20),
          // borderRadius: BorderRadius.only(
          //   topLeft: Radius.circular(20),
          //   topRight: Radius.circular(20)
          // ),
          boxShadow: [
            BoxShadow(
                color: shadowColor.withOpacity(0.1),
                blurRadius: 1,
                spreadRadius: 1,
                offset: Offset(0, 1))
          ]),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List.generate(
              barItems.length,
              (index) => BottomBarItem(
                    activeTab == index
                        ? barItems[index]["active_icon"]
                        : barItems[index]["icon"],
                    "",
                    isActive: activeTab == index,
                    activeColor: primary,
                    onTap: () {
                      setState(() {
                        activeTab = index;
                      });
                    },
                  ))),
    );
  }
}
