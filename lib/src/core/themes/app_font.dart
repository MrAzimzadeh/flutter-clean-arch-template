import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFont {
  AppFont._();

  static TextStyle normal = GoogleFonts.poppins(fontWeight: FontWeight.normal);
  static TextStyle bold = GoogleFonts.poppins(fontWeight: FontWeight.bold);
  static TextStyle w500 = GoogleFonts.poppins(fontWeight: FontWeight.w500);
  static TextStyle w600 = GoogleFonts.poppins(fontWeight: FontWeight.w600);
  static TextStyle w700 = GoogleFonts.poppins(fontWeight: FontWeight.w700);
  static TextStyle w800 = GoogleFonts.poppins(fontWeight: FontWeight.w800);
  static TextStyle w900 = GoogleFonts.poppins(fontWeight: FontWeight.w900);
  static TextStyle w100 = GoogleFonts.poppins(fontWeight: FontWeight.w100);
  static TextStyle w200 = GoogleFonts.poppins(fontWeight: FontWeight.w200);
  static TextStyle w300 = GoogleFonts.poppins(fontWeight: FontWeight.w300);
  static TextStyle w400 = GoogleFonts.poppins(fontWeight: FontWeight.w400);
  static TextStyle wI400 = GoogleFonts.inter(fontWeight: FontWeight.w400);

  static TextStyle appBarTitle =
      GoogleFonts.poppins(fontWeight: FontWeight.w500);
  static TextStyle poppinsNormal =
      GoogleFonts.poppins(fontWeight: FontWeight.w400);
  static TextStyle abhaya =
      GoogleFonts.abhayaLibre(fontWeight: FontWeight.w400);
}

extension AppFontSize on TextStyle {
  TextStyle get s4 {
    return copyWith(fontSize: 4.sp);
  }

  TextStyle get s6 {
    return copyWith(fontSize: 6.sp);
  }

  TextStyle get s8 {
    return copyWith(fontSize: 8.sp);
  }

  TextStyle get s9 {
    return copyWith(fontSize: 9.sp);
  }

  TextStyle get s10 {
    return copyWith(fontSize: 10.sp);
  }

  TextStyle get s12 {
    return copyWith(fontSize: 12);
  }

  TextStyle get s14 {
    return copyWith(fontSize: 14.sp);
  }

  TextStyle get s16 {
    return copyWith(fontSize: 16);
  }

  TextStyle get s18 {
    return copyWith(fontSize: 18);
  }

  TextStyle get s20 {
    return copyWith(fontSize: 20);
  }

  TextStyle get s22 {
    return copyWith(fontSize: 22);
  }

  TextStyle get s24 {
    return copyWith(fontSize: 24);
  }
}
