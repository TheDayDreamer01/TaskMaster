import "package:flutter/material.dart";
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import "package:persistent_bottom_nav_bar/persistent_tab_view.dart";
import "package:taskmaster/consts/color_const.dart";
import "package:taskmaster/screens/dashboard/page/activity_page.dart";
import "package:taskmaster/screens/dashboard/page/calendar_page.dart";
import "package:taskmaster/screens/dashboard/page/home_page.dart";
import "package:taskmaster/screens/dashboard/page/settings_page.dart";


class DashboardView extends StatelessWidget {
  
  final PersistentTabController _controller = PersistentTabController();
  
  DashboardView({ Key ? key }) : super(key : key);

  List<Widget> _buildScreens() {
    return [
      const HomePage(),
      const CalendarPage(),
      const ActivityPage(),
      const SettingsPage()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
        PersistentBottomNavBarItem(
            icon: const Icon(FeatherIcons.home),
            title: ("Home"),
            activeColorPrimary: TaskMasterColor.coralRed,
            inactiveColorPrimary: TaskMasterColor.grey,
        ),
        PersistentBottomNavBarItem(
            icon: const Icon(FeatherIcons.calendar),
            title: ("Celendar"),
            activeColorPrimary: TaskMasterColor.coralRed,
            inactiveColorPrimary: TaskMasterColor.grey,
        ),
        PersistentBottomNavBarItem(
            icon: const Icon(FeatherIcons.activity),
            title: ("Activity"),
            activeColorPrimary: TaskMasterColor.coralRed,
            inactiveColorPrimary: TaskMasterColor.grey,
        ),
        PersistentBottomNavBarItem(
            icon: const Icon(FeatherIcons.settings),
            title: ("Settings"),
            activeColorPrimary: TaskMasterColor.coralRed,
            inactiveColorPrimary: TaskMasterColor.grey,
        ),
    ];
  }

  @override
  Widget build(BuildContext context){
    return PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        backgroundColor: TaskMasterColor.white!,
        resizeToAvoidBottomInset: true,
        hideNavigationBarWhenKeyboardShows: true,
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),

        screenTransitionAnimation: const ScreenTransitionAnimation( 
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),

        navBarStyle: NavBarStyle.style12, 
    );
  }
}