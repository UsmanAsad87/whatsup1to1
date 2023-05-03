import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsup1to1/app/user_auth/controllers/auth_controller.dart';
import 'package:whatsup1to1/common/common_libs.dart';
import 'package:whatsup1to1/common/widgets/CustomTextFields.dart';
import 'package:whatsup1to1/common/widgets/custom_button.dart';
import 'package:whatsup1to1/generated/l10n.dart';
import 'package:whatsup1to1/routes/route_manager.dart';
import 'package:whatsup1to1/utils/constants/app_constants.dart';
import 'package:whatsup1to1/utils/constants/assets_manager.dart';

class UserForgetPassScreen extends StatefulWidget {
  const UserForgetPassScreen({Key? key}) : super(key: key);

  @override
  State<UserForgetPassScreen> createState() => _UserForgetPassScreenState();
}

class _UserForgetPassScreenState extends State<UserForgetPassScreen> {
  final TextEditingController _emailController = TextEditingController();
  GlobalKey<FormState> forgotKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  forgotPass(WidgetRef ref) async {
    if (forgotKey.currentState!.validate()) {
      final authCtr = ref.read(authControllerProvider.notifier);
      await authCtr.forgotPassword(
          email: _emailController.text, context: context);
      setState(() {
        _emailController.clear();
      });
    }
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
                      S.of(context).Forgot_Password,
                      style: getSemiBoldStyle(
                          fontSize: 25.sp,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Form(
                      key: forgotKey,
                      child: Column(
                        children: [
                          CustomTextField(
                              controller: _emailController,
                              onChanged: (val) {},
                              onFieldSubmitted: (val) {},
                              obscure: false,
                              labelText: S.of(context).Email),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Consumer(builder: (context, ref, child) {
                      return CustomButton(
                          onPressed: () {
                            forgotPass(ref);
                          },
                          isLoading: ref.watch(authControllerProvider),
                          buttonText: "Send Reset Email");
                    }),
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
                          onTap: () {
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
      ),
    );
  }
}
