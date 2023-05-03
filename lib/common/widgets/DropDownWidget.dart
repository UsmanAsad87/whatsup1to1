
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsup1to1/utils/thems/styles_manager.dart';

import '../../utils/constants/assets_manager.dart';
class DropDownWidget extends StatelessWidget {
  const DropDownWidget({
    super.key,
    required this.value,
    required this.valueItems,
    required this.onChanged, required this.hintText,
  });

  final String? value;
  final List<String> valueItems;
  final Function(String?) onChanged;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color:
          Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.5)
        //border: Border.all(width: 0.5,color:  Theme.of(context).colorScheme.onPrimary.withOpacity(0.2))
      ),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      height: 40.h,
      width: double.infinity,
      child: DropdownButton(
          hint: Text(
            hintText,
            style: getMediumStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 12.sp),
          ),
          //menuMaxHeight: 250.h,
          isExpanded: true,
          //dropdownColor: kTextFieldColor,
          borderRadius: BorderRadius.circular(10),
          underline: SizedBox(),
          icon: ImageIcon(
            const AssetImage(AppAssets.arrowDownIcon),
            size: 16.h,
            color: Theme.of(context).colorScheme.secondary,
          ),
          value: value,
          focusColor: Colors.blue,
          style: getMediumStyle(
              color: Theme.of(context).colorScheme.secondary, fontSize: 12.sp),
          onChanged: onChanged,
          items: valueItems
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
              ),
            );
          }).toList()),
    );
  }
}