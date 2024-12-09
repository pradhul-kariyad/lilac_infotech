// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_import
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_infotech/core/colors/colors.dart';
import 'package:lilac_infotech/core/widgets/new_navigation/new_navigation.dart';
import 'package:lilac_infotech/screens/empty_screen/empty_screen.dart';
import 'package:lilac_infotech/screens/home/home_page.dart';
import 'package:lilac_infotech/screens/requirement_screen/car_or_bike_screen.dart';
import 'package:lilac_infotech/screens/requirement_screen/requirement_screen.dart';
import 'package:lilac_infotech/screens/total_vehicle/total_vehicle.dart';
import 'package:provider/provider.dart';
import 'package:lilac_infotech/provider/bottom_bar_provider/bottom_bar_provider.dart';

class BottomBarScreen extends StatelessWidget {
  const BottomBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return BottomBarProvider();
      },
      child: Consumer<BottomBarProvider>(
        builder: (context, provider, child) {
          final List<Widget> _pages = [
            HomePage(),
            EmptyScreen(),
            EmptyScreen(),
            CarOrBikeScreen(),
            EmptyScreen(),
          ];

          return Scaffold(
            body: _pages[provider.selectedPageIndex],
            bottomNavigationBar: Container(
              color: white,
              height: 60.h,
              child: Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        provider.updateSelectedPageIndex(0);
                      },
                      child: NewNavigation(
                        name: 'Home',
                        icon: 'assets/images/home.png',
                        iconColor:
                            provider.selectedPageIndex == 0 ? maroon : grey,
                        nameColor:
                            provider.selectedPageIndex == 0 ? maroon : grey,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        provider.updateSelectedPageIndex(1);
                      },
                      child: NewNavigation(
                        name: 'Message',
                        icon: 'assets/images/message-text.png',
                        iconColor:
                            provider.selectedPageIndex == 1 ? maroon : grey,
                        nameColor:
                            provider.selectedPageIndex == 1 ? maroon : grey,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        provider.updateSelectedPageIndex(2);
                      },
                      child: NewNavigation(
                        name: '  Sell',
                        icon: 'assets/images/task-square.png',
                        iconColor:
                            provider.selectedPageIndex == 2 ? maroon : grey,
                        nameColor:
                            provider.selectedPageIndex == 2 ? maroon : grey,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        provider.updateSelectedPageIndex(3);
                      },
                      child: NewNavigation(
                        name: 'Requirement',
                        icon: 'assets/images/task-square.png',
                        iconColor:
                            provider.selectedPageIndex == 3 ? maroon : grey,
                        nameColor:
                            provider.selectedPageIndex == 3 ? maroon : grey,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        provider.updateSelectedPageIndex(4);
                      },
                      child: NewNavigation(
                        name: 'Profile',
                        icon: 'assets/images/profile.png',
                        iconColor:
                            provider.selectedPageIndex == 4 ? maroon : grey,
                        nameColor:
                            provider.selectedPageIndex == 4 ? maroon : grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniCenterDocked,
            floatingActionButton: Padding(
              padding: EdgeInsets.all(10.sp),
              child: InkWell(
                onTap: () {
                  provider.updateSelectedPageIndex(2);
                },
                child: CircleAvatar(
                  backgroundColor: maroon,
                  radius: 35.sp,
                  child: Image(
                    image: AssetImage('assets/images/dollar-circle.png'),
                    width: 22.w,
                    height: 22.h,
                    color: white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
