import 'package:whatsup1to1/common/common_libs.dart';
import 'package:whatsup1to1/utils/thems/my_colors.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    required this.onPressed,
    this.backColor, this.iconColor, required this.icon, this.iconSize,

  });
  final Function()? onPressed;
  final String icon;
  final Color? backColor;
  final Color? iconColor;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.h,
      height: 30.w,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: RawMaterialButton(
          elevation: 1,
          fillColor: backColor??Theme.of(context).colorScheme.primary,
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Container(
            // padding: EdgeInsets.symmetric(vertical: 10.h),
            width: iconSize??20.h,
            height: iconSize??20.w,
            child: ImageIcon(
              AssetImage(icon),
              size: 16.h,
              color: iconColor??MyColors.white,

            ),
          ),),
    );
  }
}
