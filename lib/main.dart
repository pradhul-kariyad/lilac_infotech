// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_infotech/core/auth/log_in/log_in.dart';
import 'package:lilac_infotech/screens/home/home_page.dart';
import 'package:lilac_infotech/screens/requirement_screen/car_bike.dart';
import 'package:lilac_infotech/screens/requirement_screen/requirement_screen.dart';
import 'package:lilac_infotech/screens/total_vehicle/total_vehicle.dart';
import 'package:lilac_infotech/screens/vehicle_details_screen/vehicle_details_screen.dart';
import 'package:lilac_infotech/screens/vehicle_requirment/vehicle_requirment.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool userId = prefs.getBool('userId') ?? false;
  runApp(MyApp(userId: userId));
}

class MyApp extends StatelessWidget {
  final bool userId;
  const MyApp({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Machine-Test',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: child,
        );
      },
      child: const VehicleDetailsScreen(),
    );
  }
}
