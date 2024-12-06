// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_print, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_infotech/core/colors/colors.dart';
import 'package:lilac_infotech/core/widgets/logo/logo.dart';
import 'package:lilac_infotech/core/widgets/my_button/my_button.dart';
import 'package:lilac_infotech/core/widgets/my_form/email_form/email_form.dart';
import 'package:lilac_infotech/core/widgets/my_form/password_form/password_form.dart';
import 'package:lilac_infotech/provider/login_provider/login_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(backgroundColor: scaffoldColor),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formKey,
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
              Consumer<LoginProvider>(
                builder: (BuildContext context, logInProvider, Widget? child) {
                  if (logInProvider.isLoading) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: maroon,
                      strokeAlign: -4,
                    ));
                  }
                  return MyButton(
                      name: 'Login',
                      onTap: () async {
                        print('Login');
                        if (_formKey.currentState!.validate()) {
                          SharedPreferences preferences =
                              await SharedPreferences.getInstance();
                          await preferences.setBool('userId', true);
                          logInProvider.logIn(_emailController.text.trim(),
                              _passwordController.text.trim(), context);
                        }
                      });
                },
              ),
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
      ),
    );
  }
}
