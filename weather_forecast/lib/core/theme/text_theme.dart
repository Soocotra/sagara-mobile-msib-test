import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  static TextTheme get theme => TextTheme(
        // Display Styles
        displayLarge: GoogleFonts.poppins(
          fontSize: 57.sp,
          fontWeight: FontWeight.w400,
          height: 44 / 36,
          letterSpacing: 0.0,
        ),
        displayMedium: GoogleFonts.poppins(
          fontSize: 45.sp,
          fontWeight: FontWeight.w400,
          height: 52 / 45,
          letterSpacing: 0.0,
        ),
        displaySmall: GoogleFonts.poppins(
          fontSize: 36.sp,
          fontWeight: FontWeight.w400,
          height: 64 / 57,
          letterSpacing: -0.25,
        ),

        // Headline Styles
        headlineLarge: GoogleFonts.poppins(
          fontSize: 32.sp,
          fontWeight: FontWeight.w400,
          height: 40 / 32,
          letterSpacing: 0.0,
        ),
        headlineMedium: GoogleFonts.poppins(
          fontSize: 28.sp,
          fontWeight: FontWeight.w400,
          height: 36 / 28,
          letterSpacing: 0.0,
        ),
        headlineSmall: GoogleFonts.poppins(
          fontSize: 24.sp,
          fontWeight: FontWeight.w400,
          height: 32 / 24,
          letterSpacing: 0.0,
        ),

        // Title Styles
        titleLarge: GoogleFonts.poppins(
          fontSize: 22.sp,
          fontWeight: FontWeight.w700, // Bold
          height: 28 / 22,
          letterSpacing: 0.0,
        ),
        titleMedium: GoogleFonts.poppins(
          fontSize: 18.sp,
          fontWeight: FontWeight.w700, // Bold
          height: 24 / 18,
          letterSpacing: 0.1,
        ),
        titleSmall: GoogleFonts.poppins(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500, // Medium
          height: 20 / 14,
          letterSpacing: 0.1,
        ),

        // Body Styles
        bodyLarge: GoogleFonts.poppins(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          height: 24 / 16,
          letterSpacing: 0.5,
        ),
        bodyMedium: GoogleFonts.poppins(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          height: 20 / 14,
          letterSpacing: 0.25,
        ),
        bodySmall: GoogleFonts.poppins(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          height: 16 / 12,
          letterSpacing: 0.4,
        ),

        // Label Styles
        labelLarge: GoogleFonts.poppins(
          fontSize: 16.sp,
          fontWeight: FontWeight.w700, // Bold
          height: 20 / 16,
          letterSpacing: 0.1,
        ),
        labelMedium: GoogleFonts.poppins(
          fontSize: 12.sp,
          fontWeight: FontWeight.w700, // Bold
          height: 16 / 12,
          letterSpacing: 0.5,
        ),
        labelSmall: GoogleFonts.poppins(
          fontSize: 10.sp,
          fontWeight: FontWeight.w700, // Bold
          height: 16 / 10,
          letterSpacing: 0.0,
        ),
      );
}
