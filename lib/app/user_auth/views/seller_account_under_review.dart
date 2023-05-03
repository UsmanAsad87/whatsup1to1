import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsup1to1/common/widgets/custom_button.dart';
import 'package:whatsup1to1/generated/l10n.dart';
import 'package:whatsup1to1/routes/route_manager.dart';
import 'package:whatsup1to1/utils/constants/app_constants.dart';
import 'package:whatsup1to1/utils/constants/assets_manager.dart';
import 'package:whatsup1to1/utils/thems/my_colors.dart';

import '../../../../common/common_libs.dart';

class SellerAccountUnderReviewScreen extends ConsumerWidget {
  const SellerAccountUnderReviewScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding:EdgeInsets.all(AppConstants.padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppAssets.successImageGif, scale: 2.8),
              SizedBox(
                height: 20.h,
              ),
              Text(
                S.of(context).Your_account_is_Under_Review,
                style: getSemiBoldStyle(
                    color: MyColors.themeColor, fontSize: 16.sp),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                S.of(context).We_will_update_you_shortly,
                textAlign: TextAlign.center,
                style: getSemiBoldStyle(
                    color: MyColors.contentColor, fontSize: 14.sp),
              ),
              SizedBox(
                height: 80.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
