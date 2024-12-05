// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_infotech/core/colors/colors.dart';
import 'package:lilac_infotech/core/widgets/logo/logo.dart';
import 'package:lilac_infotech/core/widgets/my_button/my_button.dart';
import 'package:lilac_infotech/core/widgets/my_form/email_form.dart';
import 'package:lilac_infotech/core/widgets/my_form/password_form.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(backgroundColor: scaffoldColor),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Logo(),
            EmailForm(
              controller: _emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                // String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                // RegExp regExp = RegExp(pattern);
                // if (!regExp.hasMatch(value)) {
                //   return 'Enter a valid email';
                // }
                return null;
              },
            ),
            PasswordForm(
              controller: _passwordController,
              validator: (value) {
                return value!.length < 6
                    ? 'Must be at least 6 character'
                    : null;
              },
              // onSaved: (value) {},
            ),
            Padding(
              padding: EdgeInsets.only(right: 15.w, top: 8.h, bottom: 180.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      print('Forgot Password');
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          color: blue,
                          fontFamily: 'Poppins',
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            MyButton(
                name: 'Login',
                onTap: () {
                  print('Login');
                }),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don’t have an account?',
                  style: TextStyle(
                      color: black,
                      fontFamily: 'Poppins',
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  'Register',
                  style: TextStyle(
                      color: blue,
                      fontFamily: 'Poppins',
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
