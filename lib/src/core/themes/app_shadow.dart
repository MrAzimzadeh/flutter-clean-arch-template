import 'package:cleanarcjh/src/core/themes/app_color.dart';
import 'package:flutter/material.dart';

class AppShadow {
  static List<BoxShadow> get medium => [
        BoxShadow(
          color: AppColor.shadowColor,
          offset: Offset(0, 4),
          blurRadius: 6.1,
        ),
      ];
}
