// ignore_for_file: unused_import, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_infotech/core/colors/colors.dart';
import 'package:lilac_infotech/core/widgets/my_button/my_button.dart';
import 'package:lilac_infotech/screens/requirement_screen/car_bike.dart';
import 'package:lilac_infotech/screens/vehicle_requirment/vehicle_requirment.dart';

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({super.key});

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: white,
        leading: InkWell(
            onTap: () {
              print('Back button');
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return CarBike();
              }));
            },
            child: Image(image: AssetImage('assets/images/arrow-left.png'))),
        title: Padding(
          padding: EdgeInsets.only(left: 45.w),
          child: Text(
            'Requirement  List',
            style: TextStyle(
                color: black,
                fontFamily: 'Poppins',
                fontSize: 14.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Stack(children: [
              Container(
                margin: EdgeInsets.only(top: 20.h),
                width: 330.w,
                height: 110.h,
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(10.sp)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 10.h, left: 10.w, right: 10.w, bottom: 3.h),
                      child: Text(
                        'Rolls Roys Ghost Standard (2020)',
                        style: TextStyle(
                            color: black,
                            fontFamily: 'Poppins',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 10.w, right: 10.w, bottom: 3.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Transmission',
                              style: TextStyle(
                                  color: Color(0xff6F6C7A),
                                  fontFamily: 'Poppins',
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500)),
                          Text(
                            'Automatic',
                            style: TextStyle(
                                color: black,
                                fontFamily: 'Poppins',
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 10.w, right: 10.w, bottom: 3.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Fuel',
                              style: TextStyle(
                                  color: Color(0xff6F6C7A),
                                  fontFamily: 'Poppins',
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500)),
                          Text(
                            'Petrol',
                            style: TextStyle(
                                color: black,
                                fontFamily: 'Poppins',
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 10.w, right: 10.w, bottom: 3.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Color',
                              style: TextStyle(
                                  color: Color(0xff6F6C7A),
                                  fontFamily: 'Poppins',
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500)),
                          Text(
                            'Black',
                            style: TextStyle(
                                color: black,
                                fontFamily: 'Poppins',
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w, top: 1.h),
                      child: Text('Active',
                          style: TextStyle(
                              color: black,
                              fontFamily: 'Poppins',
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              ),
              Positioned(
                  left: 275.w,
                  bottom: 2.h,
                  child: Transform.scale(
                    scale: 0.6.sp,
                    child: Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                          print('Switch is now $value');
                        });
                      },
                      activeColor: Colors.white,
                      activeTrackColor: maroon,
                      inactiveThumbColor: Colors.grey,
                      inactiveTrackColor: Colors.grey[300],
                    ),
                  ))
            ]),
          ),
          Spacer(),
          MyButton(
              name: '+ Create A Requirement',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return VehicleRequirment();
                }));
                print('Create A Requirement');
              }),
          SizedBox(height: 15.h)
        ],
      ),
    );
  }
}
