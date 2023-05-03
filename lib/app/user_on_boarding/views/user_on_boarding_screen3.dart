
import 'package:whatsup1to1/common/common_libs.dart';
import 'package:whatsup1to1/common/widgets/custom_button.dart';
import 'package:whatsup1to1/generated/l10n.dart';
import 'package:whatsup1to1/routes/route_manager.dart';
import 'package:whatsup1to1/utils/constants/assets_manager.dart';

import '../../../utils/constants/app_constants.dart';

class UserOnBoardingScreen3 extends StatelessWidget {
  const UserOnBoardingScreen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: -190.h,
              right: -160.w,
              child: CircleAvatar(
                radius: 150.r,
                backgroundColor:
                    Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.5),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(AppConstants.padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        AppAssets.logo,
                        width: 115.w,
                        height: 42.h,
                      ),
                      InkWell(
                          onTap: () {  Navigator.pushNamed(
                              context, AppRoutes.userLoginScreen);},
                          child: Text(
                            S.of(context).SKIP,
                            style: getRegularStyle(
                                color: Theme.of(context).colorScheme.secondary),
                          ))
                    ],
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0.r),
                    child: Image.asset(
                      AppAssets.onBoarding3,
                      width: 276.w,
                      height: 394.h,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  CustomButton(onPressed: () {
                    Navigator.pushNamed(
                        context, AppRoutes.userLoginScreen);
                  }, buttonText: S.of(context).Start_Shopping),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).Already_have_an_account,
                        style: getMediumStyle(
                            fontSize: 14.sp,
                            color: Theme.of(context).colorScheme.tertiary),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(
                              context, AppRoutes.userLoginScreen);
                        },
                        child: Text(
                          " ${S.of(context).Sign_In}",
                          style: getMediumStyle(
                              fontSize: 14.sp,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
