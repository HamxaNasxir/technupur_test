import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../network_service/models/bottomNavModel.dart';
import '../utils/colors.dart';
import '../view_model/bottomNavProvider.dart';

class BottomNavPage extends StatelessWidget {
  final Key bottomNavKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Color selectedItemColor = whiteColor;
    Color unselectedItemColor = greyTextColor;

    final navProvider = Provider.of<BottomNavProvider>(context);
    int currentScreenIndex = navProvider.fetchCurrentScreenIndex;

    return Scaffold(
      bottomNavigationBar: ClipRRect(
        child: BottomNavigationBar(
          key: bottomNavKey,
          items: navProvider.getNavItemList
              .map(
                (BottomNavItem navItem) => BottomNavigationBarItem(
                    icon: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      child: Image.asset(
                        navItem.iconData,
                        width: 18,
                        height: 18,
                        color: navProvider.getNavItemList.indexOf(navItem) == navProvider.pageSelectionIndex ? selectedItemColor : unselectedItemColor,
                      ),
                    ),
                    label: "",
                    tooltip: ""),
              )
              .toList(),
          elevation: 1,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: primaryColor,
          selectedItemColor: selectedItemColor,
          unselectedItemColor: unselectedItemColor,
          currentIndex: navProvider.pageSelectionIndex,
          onTap: (index) {
            navProvider.updatePageSelection(index);
          },
        ),
      ),
      body: navProvider.screens[currentScreenIndex],
    );
  }
}
