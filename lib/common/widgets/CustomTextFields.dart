import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsup1to1/common/common_libs.dart';
import 'package:whatsup1to1/utils/constants/assets_manager.dart';


class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final Function(String) onChanged;
  final Function(String) onFieldSubmitted;
  final TextInputType? inputType;
  final bool? obscure;
  final IconData? icon;
  final String? Function(String?)? validatorFn;
  final String labelText;
  final int? maxLines;

  const CustomTextField({
    Key? key,
    required this.controller,
    this.hintText,
    required this.onChanged,
    required this.onFieldSubmitted,
    this.inputType,
    this.obscure,
    this.validatorFn,
    this.icon, required this.labelText, this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.0.h),
      child: TextFormField(
        validator: validatorFn??(val) {
          if (val!.isEmpty) {
            return "Please enter some text!";
          } else {
            return null;
          }
        },
        obscureText: obscure??false,
        controller: controller,
        keyboardType: inputType,
        maxLines: maxLines?? 1,
        style: getMediumStyle(color: Theme.of(context).colorScheme.secondary),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: maxLines != null ? 10: 0),
          hintText: hintText??"",
          hintStyle: getMediumStyle(color: Theme.of(context).colorScheme.tertiary),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText:"  $labelText  " ,
          labelStyle: TextStyle(
              color: Theme.of(context).colorScheme.tertiary, fontWeight: FontWeight.w300),
          enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: Theme.of(context).colorScheme.secondaryContainer, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).primaryColor.withOpacity(0.5), width: 2.0),
          ),
          border: OutlineInputBorder(),
          focusedErrorBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: Theme.of(context).colorScheme.secondaryContainer, width: 1.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.2),
                width: 1.0),
          ),
        ),
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
      ),
    );
  }
}





class CustomTextFieldWithIcon extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final Function(String) onChanged;
  final Function(String) onFieldSubmitted;
  final TextInputType? inputType;
  final bool? obscure;
  final IconData? icon;
  final String? Function(String?)? validatorFn;
  final Widget? leadingIcon;
  final String labelText;
  final int? maxLines;

  const CustomTextFieldWithIcon({
    Key? key,
    required this.controller,
    this.hintText,
    required this.onChanged,
    required this.onFieldSubmitted,
    this.inputType,
    this.obscure,
    this.validatorFn,
    this.icon, required this.labelText, this.maxLines, this.leadingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.0.h),
      child: TextFormField(
        validator: validatorFn??(val) {
          if (val!.isEmpty) {
            return "Please enter some text!";
          } else {
            return null;
          }
        },
        obscureText: obscure??false,
        controller: controller,
        keyboardType: inputType,
        maxLines: maxLines?? 1,
        style: getMediumStyle(color: Theme.of(context).colorScheme.secondary),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
          suffixIcon: leadingIcon ?? SizedBox.shrink(),
          hintText: hintText??"",
          hintStyle: getMediumStyle(color: Theme.of(context).colorScheme.tertiary),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText:"  $labelText  " ,
          labelStyle: TextStyle(
              color: Theme.of(context).colorScheme.tertiary, fontWeight: FontWeight.w300),
          enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: Theme.of(context).colorScheme.secondaryContainer, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).primaryColor.withOpacity(0.5), width: 2.0),
          ),
          border: OutlineInputBorder(),
          focusedErrorBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: Theme.of(context).colorScheme.secondaryContainer, width: 1.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.2),
                width: 1.0),
          ),
        ),
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
      ),
    );
  }
}

class CustomSearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String) onChanged;
  final Function(String) onFieldSubmitted;
  final TextInputType? inputType;
  final IconData? icon;
  final Widget? leadingIcon;

  const CustomSearchTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
    required this.onFieldSubmitted,
    this.inputType,
    this.leadingIcon,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.0.h),
      child: Container(
        width: double.infinity,
        height: 35.h,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiaryContainer,
          borderRadius: BorderRadius.circular(5.r)

        ),
        child: TextFormField(


          controller: controller,
          keyboardType: inputType,
          style: getMediumStyle(color: Theme.of(context).colorScheme.secondary,fontSize: 12.sp),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ImageIcon(
                const AssetImage(
                  AppAssets.searchIcon,
                ),
                size: 12.h,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            hintText: hintText,
            hintStyle: getMediumStyle(color: Theme.of(context).colorScheme.tertiary,fontSize: 12.sp),

            floatingLabelBehavior: FloatingLabelBehavior.always,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
              borderSide:
              BorderSide(color: Theme.of(context).colorScheme.secondaryContainer, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.tertiaryContainer.withOpacity(0.5), width: 2),
            ),
            border: OutlineInputBorder( borderRadius: BorderRadius.circular(5.r),),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
              borderSide:
              BorderSide(color: Theme.of(context).colorScheme.tertiaryContainer, width: 1.0),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.r),
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.tertiaryContainer.withOpacity(0.2),
                  width: 1.0),
            ),
          ),
          onFieldSubmitted: onFieldSubmitted,
          onChanged: onChanged,
        ),
      ),
    );
  }
}