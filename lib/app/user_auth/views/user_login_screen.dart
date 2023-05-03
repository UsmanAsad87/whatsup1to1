import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsup1to1/app/user_auth/controllers/auth_controller.dart';
import 'package:whatsup1to1/common/common_libs.dart';
import 'package:whatsup1to1/common/widgets/CustomTextFields.dart';
import 'package:whatsup1to1/common/widgets/custom_button.dart';
import 'package:whatsup1to1/common/widgets/validator.dart';
import 'package:whatsup1to1/generated/l10n.dart';
import 'package:whatsup1to1/routes/route_manager.dart';
import 'package:whatsup1to1/utils/constants/app_constants.dart';
import 'package:whatsup1to1/utils/constants/assets_manager.dart';

class UserLoginScreen extends StatefulWidget {
  const UserLoginScreen({Key? key}) : super(key: key);

  @override
  State<UserLoginScreen> createState() => _UserLoginScreenState();
}

class _UserLoginScreenState extends State<UserLoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  GlobalKey<FormState> loginInKey = GlobalKey<FormState>();
  var passObscure = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  login(WidgetRef ref) async {
    if (loginInKey.currentState!.validate()) {
      final authCtr = ref.read(authControllerProvider.notifier);
      await authCtr.signInUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passController.text,
          context: context);
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
                        InkWell(
                            onTap: () {
                              // Navigator.pushNamed(
                              //     context, AppRoutes.userMainMenu);
                            },
                            child: Text(
                              S.of(context).SKIP,
                              style: getRegularStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                    Text(
                      S.of(context).Hey,
                      style: getSemiBoldStyle(
                          fontSize: 25.sp,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    Text(
                      S.of(context).Login_Now,
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
                              controller: _emailController,
                              validatorFn: emailValidator,
                              onChanged: (val) {},
                              onFieldSubmitted: (val) {},
                              obscure: false,
                              labelText: S.of(context).Email),
                          CustomTextFieldWithIcon(
                              controller: _passController,
                              onChanged: (val) {},
                              onFieldSubmitted: (val) {},
                              validatorFn: passValidator,
                              obscure: passObscure,
                              leadingIcon: passObscure == false
                                  ? InkWell(
                                      onTap: () {
                                        setState(() {
                                          passObscure = !passObscure;
                                        });
                                      },
                                      child: Icon(CupertinoIcons.eye,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary))
                                  : InkWell(
                                      onTap: () {
                                        setState(() {
                                          passObscure = !passObscure;
                                        });
                                      },
                                      child: Icon(
                                        CupertinoIcons.eye_slash,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary,
                                      )),
                              labelText: S.of(context).Password),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, AppRoutes.userForgetPassScreen);
                          },
                          child: Text(
                            S.of(context).Forgot_Password,
                            style: getSemiBoldStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 14.sp),
                          )),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Consumer(
                      builder: (context,ref,child) {
                        return CustomButton(
                            onPressed: () {
                              login(ref);
                            },
                            isLoading: ref.watch(authControllerProvider),
                            buttonText: S.of(context).SIGN_IN_button);
                      }
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 1.h,
                          width: 90.w,
                          color: Theme.of(context).colorScheme.secondaryContainer,
                        ),
                        Text(
                          S.of(context).Or_sign_in_with,
                          style: getMediumStyle(
                              fontSize: 12.sp,
                              color: Theme.of(context).colorScheme.tertiary),
                        ),
                        Container(
                          height: 1.h,
                          width: 90.w,
                          color: Theme.of(context).colorScheme.secondaryContainer,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppAssets.googleLogo,height: 50.h,width: 50.h,),
                        SizedBox(width: 10.h,),
                        Image.asset(AppAssets.fbLogo,height: 50.h,width: 50.h,),
                        SizedBox(width: 10.h,),
                        Image.asset(AppAssets.appleLogo,height: 50.h,width: 50.h,),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).If_you_are_new,
                          style: getMediumStyle(
                              fontSize: 14.sp,
                              color: Theme.of(context).colorScheme.tertiary),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppRoutes.userSignupScreen);
                          },
                          child: Text(
                            " ${S.of(context).Create_Now}",
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
