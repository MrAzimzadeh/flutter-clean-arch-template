import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';

appSnackBar(BuildContext context, Color color, String label) =>
    FlutterToastr.show(
      label,
      context,
      duration: FlutterToastr.lengthLong,
      position: FlutterToastr.bottom,
      backgroundColor: color,
      textStyle: const TextStyle(fontSize: 15, color: Colors.white),
      backgroundRadius: 20,
    );
