import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';


void showToast({required String msg, Color? textColor, Color? backgroundColor}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.SNACKBAR,
    timeInSecForIosWeb: 1,
    backgroundColor: backgroundColor?? Colors.white,
    textColor: textColor ?? Colors.black,
    fontSize: 15.spMax,
  );
}

showSnakBar(BuildContext context, String content){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
      )
  );
}