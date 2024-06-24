import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/config/router/app_routes.route.dart';
import 'package:flutter_base/core/core.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        ShiftBacklogRoute(),
        FunctionRoute(),
        SupplyRoute(),
        PersonRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            elevation: 24.0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            showSelectedLabels: true,
            selectedLabelStyle: TextStyle(
                color: '#0571F1'.fromHex(), fontWeight: FontWeight.w400),
            unselectedLabelStyle: TextStyle(
                color: '#C5CEE0'.fromHex(), fontWeight: FontWeight.w400),
            selectedFontSize: 12,
            unselectedFontSize: 12,
            selectedIconTheme:
                IconThemeData(size: 24, color: '#0571F1'.fromHex()),
            unselectedIconTheme:
                IconThemeData(size: 24, color: '#C5CEE0'.fromHex()),
            showUnselectedLabels: true,
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: 'Trang chủ'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month_outlined), label: 'Ca tồn'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.window), label: 'Chức năng'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark), label: 'Vật tư'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_pin_circle_sharp), label: 'Cá nhân'),
            ],
          ),
        );
      },
    );
  }
}
