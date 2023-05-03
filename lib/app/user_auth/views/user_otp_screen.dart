import 'package:flutter/cupertino.dart';
import 'package:whatsup1to1/common/common_libs.dart';
import 'package:whatsup1to1/common/widgets/CustomTextFields.dart';
import 'package:whatsup1to1/common/widgets/custom_button.dart';
import 'package:whatsup1to1/generated/l10n.dart';
import 'package:whatsup1to1/routes/route_manager.dart';
import 'package:whatsup1to1/utils/constants/app_constants.dart';
import 'package:whatsup1to1/utils/constants/assets_manager.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class UserOTPScreen extends StatefulWidget {
  const UserOTPScreen({Key? key}) : super(key: key);

  @override
  State<UserOTPScreen> createState() => _UserOTPScreenState();
}

class _UserOTPScreenState extends State<UserOTPScreen> {
  TextEditingController textEditingController = TextEditingController();
  String currentText = "";


  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: -230.h,
                right: -130.w,
                child: CircleAvatar(
                  radius: 180.r,
                  backgroundColor: Theme.of(context)
                      .colorScheme
                      .secondaryContainer
                      .withOpacity(0.5),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(AppConstants.padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          AppAssets.logo,
                          width: 115.w,
                          height: 42.h,
                        ),
                       const SizedBox(),
                      ],
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                    Text(
                      S.of(context).Code_Verification,
                      style: getSemiBoldStyle(
                          fontSize: 14.sp,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    Text(
                      S.of(context).Enter_your_verification_code_here,
                      style: getMediumStyle(
                          fontSize: 14.sp,
                          color: Theme.of(context).colorScheme.tertiary),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      '+981 215 1545',
                      style: getMediumStyle(
                          fontSize: 14.sp,
                          color: Theme.of(context).colorScheme.secondary),
                    ),

                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      width: 250.w,
                      child: PinCodeTextField(
                        length: 4,
                        obscureText: false,
                        textStyle: getMediumStyle(color: Theme.of(context).colorScheme.secondary),
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5.r),
                          fieldHeight: 50.h,
                          fieldWidth: 50.w,
                          activeColor: Colors.white,
                          inactiveColor: Colors.white,
                          selectedFillColor:Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.5),
                          inactiveFillColor: Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.5),
                          activeFillColor: Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.5),
                        ),
                        animationDuration: const Duration(milliseconds: 300),
                        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                        enableActiveFill: true,
                        controller: textEditingController,
                        onCompleted: (v) {
                          debugPrint("Completed");
                        },
                        onChanged: (value) {
                          debugPrint(value);
                          setState(() {
                            currentText = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          return true;
                        },
                        appContext: context,
                      ),
                    ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).Dont_get_code,
                          style: getMediumStyle(
                              fontSize: 14.sp,
                              color: Theme.of(context).colorScheme.tertiary),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "  ${S.of(context).Resend}",
                            style: getMediumStyle(
                                fontSize: 14.sp,
                                color: Theme.of(context).colorScheme.secondary),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    CustomButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, AppRoutes.userLoginScreen);
                        },
                        buttonText: S.of(context).DONE),
                    SizedBox(
                      height: 10.h,
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
