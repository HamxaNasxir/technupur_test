import 'package:flutter/material.dart';
import 'package:technupur/views/menus/categoryPage.dart';
import 'package:technupur/views/menus/cartPage.dart';
import 'package:technupur/views/menus/userPage.dart';
import 'package:technupur/views/menus/wishlistPage.dart';

import '../network_service/models/bottomNavModel.dart';
import '../utils/enums.dart';
import '../utils/images.dart';
import '../views/menus/dashboard.dart';

class BottomNavProvider with ChangeNotifier {
  int pageSelectionIndex = 0;

  int get fetchCurrentScreenIndex => pageSelectionIndex;

  void updatePageSelection(int index) {
    pageSelectionIndex = index;
    notifyListeners();
  }

  List<dynamic> screens = [
    DashboardPage(),
    WishlistPage(),
    CategoryPage(),
    CartPage(),
    UserPage(),
  ];

  List<BottomNavItem> navItems = [];

  List<BottomNavItem> get getNavItemList => getNavItems();

  List<BottomNavItem> getNavItems() {
    return [
      const BottomNavItem(
        navTitle: "Dashboard",
        iconData: menuDashboard,
        menuCode: MenuCode.DASHBOARD,
      ),
      const BottomNavItem(
        navTitle: "Watch",
        iconData: menuCategory,
        menuCode: MenuCode.CATEGORY,
      ),
      const BottomNavItem(
        navTitle: "Media Library",
        iconData: menuCart,
        menuCode: MenuCode.CARRT,
      ),
      const BottomNavItem(
        navTitle: "More",
        iconData: menuWishlist,
        menuCode: MenuCode.WISHLIST,
      ),
      const BottomNavItem(
        navTitle: "More",
        iconData: menuWishlist,
        menuCode: MenuCode.WISHLIST,
      ),
    ];
  }
}
