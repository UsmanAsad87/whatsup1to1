



import 'package:whatsup1to1/common/common_libs.dart';
import 'package:whatsup1to1/utils/loading.dart';
import 'package:whatsup1to1/utils/thems/my_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.onPressed,
    required this.buttonText,
    this.isLoading = false,
    this.backColor,
    this.textColor,
    this.buttonWidth,
    this.buttonHeight,
    this.fontSize, this.padding,
  });
  final Function()? onPressed;
  final String buttonText;
  final bool isLoading;
  final Color? backColor;
  final Color? textColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? fontSize;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonHeight?? null,
      margin: EdgeInsets.symmetric(vertical: padding??10.h),
      child: RawMaterialButton(
        elevation: 2,
        fillColor: backColor??Theme.of(context).colorScheme.primary,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Container(
          // padding: EdgeInsets.symmetric(vertical: 10.h),
          width: buttonWidth?? double.infinity,
          height: buttonHeight?? null,
          child: Center(
            child: isLoading
                ? LoadingWidget( color: MyColors.white,)
                : Text(
              buttonText,
              style:
              getMediumStyle(color:textColor?? Colors.white, fontSize:fontSize?? 16.sp ),
            )
          ),
        ),
      ),
    );
  }
}
