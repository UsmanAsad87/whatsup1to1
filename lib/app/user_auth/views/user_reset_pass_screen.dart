import 'package:flutter/cupertino.dart';
import 'package:whatsup1to1/common/common_libs.dart';
import 'package:whatsup1to1/common/widgets/CustomTextFields.dart';
import 'package:whatsup1to1/common/widgets/custom_button.dart';
import 'package:whatsup1to1/generated/l10n.dart';
import 'package:whatsup1to1/routes/route_manager.dart';
import 'package:whatsup1to1/utils/constants/app_constants.dart';
import 'package:whatsup1to1/utils/constants/assets_manager.dart';

class UserResetPassScreen extends StatefulWidget {
  const UserResetPassScreen({Key? key}) : super(key: key);

  @override
  State<UserResetPassScreen> createState() => _UserResetPassScreenState();
}

class _UserResetPassScreenState extends State<UserResetPassScreen> {
  final TextEditingController _oldPassController = TextEditingController();
  final TextEditingController _newPassController = TextEditingController();
  final TextEditingController _confirmNewPassController = TextEditingController();
  GlobalKey<FormState> loginInKey = GlobalKey<FormState>();


  @override
  void dispose() {
    _oldPassController.dispose();
    _newPassController.dispose();
    _confirmNewPassController.dispose();
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
                      S.of(context).Reset_Password,
                      style: getSemiBoldStyle(
                          fontSize: 25.sp,
                          color: Theme.of(context).colorScheme.secondary),
                    ),

                    SizedBox(
                      height: 20.h,
                    ),
                    Form(
                      key: loginInKey,
                      child: Column(
                        children: [
                          CustomTextField(
                              controller: _oldPassController,
                              onChanged: (val) {},
                              onFieldSubmitted: (val) {},
                              obscure: false,
                              labelText: S.of(context).Current_Password),
                          CustomTextField(
                              controller: _newPassController,
                              onChanged: (val) {},
                              onFieldSubmitted: (val) {},
                              obscure: false,
                              labelText: S.of(context).New_Password),
                          CustomTextField(
                              controller: _confirmNewPassController,
                              onChanged: (val) {},
                              onFieldSubmitted: (val) {},
                              obscure: false,
                              labelText: S.of(context).Confirm_Password),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 10.h,
                    ),
                    CustomButton(
                        onPressed: () {

                        },
                        buttonText: S.of(context).RESET_btn),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).Back_to,
                          style: getMediumStyle(
                              fontSize: 14.sp,
                              color: Theme.of(context).colorScheme.tertiary),
                        ),
                        InkWell(
                          onTap: () {},
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
      ),
    );
  }
}
