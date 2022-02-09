import 'package:abaqe_elnakheal_app/modules/base_screen/base_screen.dart';
import 'package:abaqe_elnakheal_app/modules/categories_screen/categories_screen.dart';
import 'package:abaqe_elnakheal_app/modules/home/home_screen.dart';
import 'package:abaqe_elnakheal_app/modules/more/more_screen.dart';
import 'package:abaqe_elnakheal_app/modules/my_orders_screen/my_orders_screen.dart';
import 'package:abaqe_elnakheal_app/modules/notifications/notifications_screen.dart';
import 'package:abaqe_elnakheal_app/utils/baseDimentions.dart';
import 'package:abaqe_elnakheal_app/utils/base_text_style.dart';
import 'package:abaqe_elnakheal_app/utils/my_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'bottom_bar_icons.dart';

class MainTabsScreen extends StatefulWidget {
  MainTabsScreen();

  @override
  _MainTabsScreenState createState() => _MainTabsScreenState();
}

class _MainTabsScreenState extends State<MainTabsScreen> {
  PersistentTabController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        body: Column(
      children: [
        Expanded(child: _tabs()),
      ],
    ));
  }

  Widget _tabs() {
    return PersistentTabView(
      context,
      controller: _controller,
      padding: NavBarPadding.all(D.default_18),
        navBarHeight: D.default_90,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: C.BLUE_1,
      // Default is Colors.white.
      handleAndroidBackButtonPress: true,
      // Default is true.
      resizeToAvoidBottomInset: true,
      // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true,
      // Default is true.
      hideNavigationBarWhenKeyboardShows: true,
      // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.simple, // Choose the nav bar style with this property.
    );
  }

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const CategoriesScreen(),
      const MyOrdersScreen(),
      const NotificationsScreen(),
      const MoreScreen()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon:  Icon(MyFlutterApp.home_active,size: D.default_27,),
        title: (tr("home")),
        textStyle: S.h4(),
        activeColorPrimary: C.BLUE_2,
        activeColorSecondary:C.BLUE_2,
        inactiveColorSecondary:CupertinoColors.white,
        inactiveColorPrimary: CupertinoColors.white,
      ),
      PersistentBottomNavBarItem(
        icon:  Icon(MyFlutterApp.products_default,size: D.default_27,),
        title: (tr("products")),
        textStyle: S.h4(),
        activeColorPrimary: C.BLUE_2,
        inactiveColorPrimary: CupertinoColors.white,
      ),
      PersistentBottomNavBarItem(
        icon:  Icon(MyFlutterApp.orders_defauls,size: D.default_27,),
        title: (tr("my_orders")),
        textStyle: S.h4(),
        activeColorPrimary: C.BLUE_2,
        inactiveColorPrimary: CupertinoColors.white,

      ),
      PersistentBottomNavBarItem(
        icon: Icon(MyFlutterApp.notifications_dafault,size: D.default_27,),
        textStyle: S.h4(),
        title: (tr("notifications")),
        activeColorPrimary: C.BLUE_2,
        inactiveColorPrimary: CupertinoColors.white,
      ),
      PersistentBottomNavBarItem(
        icon:  Icon(MyFlutterApp.more_default,size: D.default_27,),
        textStyle: S.h4(),
        title: (tr("more")),
        activeColorPrimary: C.BLUE_2,
        inactiveColorPrimary: CupertinoColors.white,
      ),
    ];
  }
}
