// ignore_for_file: use_build_context_synchronously, file_names, unused_import
import 'dart:convert';
import 'dart:developer';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:lilac_infotech/core/colors/colors.dart';
import 'package:lilac_infotech/screens/bottom_bar/bottom_bar.dart';
import 'package:lilac_infotech/screens/home/home_page.dart';
import 'package:lilac_infotech/screens/total_vehicle/total_vehicle.dart';
import 'package:lilac_infotech/screens/vehicle_requirment/vehicle_requirment.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  bool isLoading = false;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> logIn(
      String username, String password, BuildContext context) async {
    try {
      setLoading(true);
      log("Sending login request...");

      var response = await http.post(
        Uri.parse('https://test.vehup.com/api/vendor-login'),
        body: {
          'email': username,
          'password': password,
        },
      );

      log('Response status code: ${response.statusCode}');
      log('Response body: ${response.body}');

      setLoading(false);

      if (response.statusCode == 200) {
        log("Log-in successful");
        var result = jsonDecode(response.body);
        String? token = result['token'];

        if (token != null) {
          SharedPreferences pref = await SharedPreferences.getInstance();
          await pref.setString('token', token);
          await pref.setBool('userlogin', true);
          log('Token stored: $token');

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => BottomBarScreen()),
          );

          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  'Welcome',
                  style: TextStyle(
                      color: maroon,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp),
                ),
                content: Text(
                  'Your Login successful...',
                  style: TextStyle(
                      color: maroon,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'OK',
                      style: TextStyle(
                        color: maroon,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              );
            },
          );
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(
          //     backgroundColor: maroon,
          //     content: Center(
          //       child: Text(
          //         "Welcome",
          //         style: TextStyle(
          //             color: white, fontFamily: 'Poppins', fontSize: 12.sp),
          //       ),
          //     ),
          //   ),
          // );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: maroon,
              content: Center(
                  child: Text(
                "Invalid username or password",
                style: TextStyle(
                    color: white, fontFamily: 'Poppins', fontSize: 12.sp),
              )),
            ),
          );
        }
      } else {
        var responseBody = jsonDecode(response.body);
        String errorMessage = responseBody['error'] ?? 'Log-in failed...';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: maroon,
            content: Center(
              child: Text(
                errorMessage,
                style: TextStyle(
                    color: white, fontFamily: 'Poppins', fontSize: 12.sp),
              ),
            ),
          ),
        );

        log("Log-in failed: $errorMessage");
      }
    } catch (e) {
      log('Error during Log-in: $e');
      setLoading(false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: maroon,
          content: Center(
            child: Text(
              "An error occurred. Please try again.",
              style: TextStyle(
                  color: white, fontFamily: 'Poppins', fontSize: 12.sp),
            ),
          ),
        ),
      );
    }
  }
}
