import 'package:whatsup1to1/common/common_libs.dart';
import 'package:whatsup1to1/utils/loading.dart';
import 'package:whatsup1to1/utils/thems/my_colors.dart';



class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    required this.onPressed,
    required this.buttonText,
    this.isLoading = false,
    this.backColor,
    this.textColor,
    this.buttonWidth,
    this.buttonHeight, this.fontSize, this.padding,
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
      margin: EdgeInsets.symmetric(vertical:padding?? 5.h),
      child: RawMaterialButton(
        elevation: 2,
        fillColor: backColor?? Theme.of(context).colorScheme.onBackground,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.r),
          side: BorderSide(
            color: MyColors.themeColor,
            width: 1.w
          )
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          width: buttonWidth?? double.infinity,
          height: buttonHeight?? null,
          child: Center(
              child: isLoading
                  ? const LoadingWidget( color: MyColors.themeColor,)
                  : Text(
                buttonText,
                style:
                getMediumStyle(color:textColor?? MyColors.themeColor,fontSize: fontSize?? 14.sp ),
              )
          ),
        ),
      ),
    );
  }
}
