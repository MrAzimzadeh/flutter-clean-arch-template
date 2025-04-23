import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_color.dart';
import 'app_font.dart';

class AppTheme {
  AppTheme._();

  static ThemeData data(bool isDark) {
    return ThemeData(
      brightness: isDark ? Brightness.dark : Brightness.light,
      scaffoldBackgroundColor:
          isDark ? const Color.fromRGBO(12, 19, 79, 1) : AppColor.white,
      dropdownMenuTheme: DropdownMenuThemeData(
        // textStyle: TextStyle(color: Colors.white),
        menuStyle: MenuStyle(
          shadowColor: WidgetStateProperty.all(AppColor.white),
          backgroundColor: WidgetStateProperty.all(AppColor.navy),
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,
          focusColor: Colors.white,
          labelStyle: TextStyle(color: Colors.white),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: isDark ? AppColor.navy : AppColor.primary,
        centerTitle: false,
        elevation: 0,
        titleTextStyle:
            AppFont.appBarTitle.s16.copyWith(color: AppColor.appBarTxt),
        toolbarHeight: 73.h,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: isDark ? AppColor.blue : AppColor.lightPurple,
        foregroundColor: isDark ? Colors.white : Colors.black,
        elevation: 2,
        extendedTextStyle: AppFont.normal.s14,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: isDark ? AppColor.blue : AppColor.lightPurple,
          elevation: 2,
          textStyle: AppFont.normal.s14,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily:
          'CustomFont', // Use bundled local font instead of loading from network
      textTheme: TextTheme(
        bodySmall: AppFont.normal.s12,
        bodyMedium: AppFont.normal.s14,
        bodyLarge: AppFont.normal.s16,
      ),
    );
  }
}
