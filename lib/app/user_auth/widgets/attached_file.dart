import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsup1to1/utils/constants/assets_manager.dart';
import 'package:whatsup1to1/utils/thems/styles_manager.dart';

class AttachedFile extends StatelessWidget {
  final String filename;
  const AttachedFile({
    Key? key,
    required this.filename,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Stack(
            children: [
              const ImageIcon(
                AssetImage(
                  AppAssets.fileIcon,
                ),
                size: 35,
                color: Color(0xFFF1F1F1),
              ),
              Positioned(
                left: 5.w,
                top: 7.h,
                child: Icon(
                  size: 20.h,
                  Icons.attach_file,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0.h),
            child: Text(filename, style: getMediumStyle(fontSize: 10.sp,color: Theme.of(context).colorScheme.secondary)),
          )
        ],
      ),
    );
  }
}
