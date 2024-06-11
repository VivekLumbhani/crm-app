import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 50.h), // To provide space from the top
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  Text(
                    'Forgot Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 50.w), // Adjust as needed for spacing
                ],
              ),
              SizedBox(height: 30.h),
              Center(
                child: Image.asset(
                  'assets/notificationcard.png', // Add your image asset
                  width: 300.w, // Adjusted size for larger image
                  height: 300.h,
                ),
              ),
              SizedBox(height: 60.h),
              Text(
                'Enter Mail',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.h),
              Text(
                'We will send you an email to reset your password',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 25.h),
              Text(
                'Email',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 10.h),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white10,
                  hintText: 'john@gmail.com',
                  hintStyle: TextStyle(color: Colors.white54),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                onPressed: () {},
                child: Text('Send Mail', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1364FF),
                  minimumSize: Size(double.infinity, 50.h),
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive?",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Send Again!',
                      style: TextStyle(color: Color(0xFF1364FF)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50.h), // Space at the bottom for better visibility
            ],
          ),
        ),
      ),
    );
  }
}
