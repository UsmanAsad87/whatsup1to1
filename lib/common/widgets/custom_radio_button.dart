import '../../utils/thems/my_colors.dart';
import '../common_libs.dart';

class CustomRadioButton extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  const CustomRadioButton({Key? key, required this.isSelected, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 15.w,
        height: 15.h,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: MyColors.white,
            border: Border.all(
                color: MyColors.contentColor
            )
        ),
        child: isSelected ? Padding(
          padding: EdgeInsets.all(5.sp),
          child: Container(
            width: 5.w,
            height: 5.h,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: MyColors.themeColor
            ),
          ),
        ): null,
      ),
    );
  }
}
