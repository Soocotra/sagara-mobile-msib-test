import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class AppDialog {
  static errPermission(String message) {
    Get.dialog(
        Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            margin: EdgeInsets.symmetric(horizontal: 32.w),
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Error",
                  textAlign: TextAlign.center,
                  style: Get.textTheme.titleLarge
                      ?.copyWith(color: Colors.redAccent),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style:
                      Get.textTheme.bodyMedium?.copyWith(color: Colors.black),
                ),
                SizedBox(
                  height: 32.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          if (Platform.isAndroid) {
                            SystemNavigator.pop();
                          } else {
                            exit(0);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: ContinuousRectangleBorder(
                                side: const BorderSide(color: Colors.redAccent),
                                borderRadius: BorderRadius.circular(16.r)),
                            backgroundColor: Colors.transparent),
                        child: Text(
                          "Quit",
                          style: Get.textTheme.bodyMedium
                              ?.copyWith(color: Colors.redAccent),
                        )),
                    SizedBox(
                      width: 16.w,
                    ),
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () async {
                            await Geolocator.openAppSettings();
                          },
                          style: ElevatedButton.styleFrom(
                              shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.r)),
                              backgroundColor: const Color(0xff40666A)),
                          child: Text(
                            "Go To Permission",
                            style: Get.textTheme.bodyMedium
                                ?.copyWith(color: Colors.white),
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        barrierDismissible: false);
  }

  static errConnection(String message) {
    Get.dialog(
        Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            margin: EdgeInsets.symmetric(horizontal: 32.w),
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Error",
                  textAlign: TextAlign.center,
                  style: Get.textTheme.titleLarge
                      ?.copyWith(color: Colors.redAccent),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style:
                      Get.textTheme.bodyMedium?.copyWith(color: Colors.black),
                ),
                SizedBox(
                  height: 32.h,
                ),
                SizedBox(
                  width: Get.width,
                  child: ElevatedButton(
                      onPressed: () async {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r)),
                          backgroundColor: const Color(0xff40666A)),
                      child: Text(
                        "Confirm",
                        style: Get.textTheme.bodyMedium
                            ?.copyWith(color: Colors.white),
                      )),
                )
              ],
            ),
          ),
        ),
        barrierDismissible: false);
  }
}
