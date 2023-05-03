import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsup1to1/app/user_auth/data/models/user_model.dart';
import 'package:whatsup1to1/common/common_libs.dart';
import 'package:whatsup1to1/common/widgets/CustomTextFields.dart';
import 'package:whatsup1to1/common/widgets/custom_button.dart';
import 'package:whatsup1to1/common/widgets/image_picker_widget.dart';
import 'package:whatsup1to1/common/widgets/toasts_widgets.dart';
import 'package:whatsup1to1/common/widgets/validator.dart';
import 'package:whatsup1to1/generated/l10n.dart';
import 'package:whatsup1to1/routes/route_manager.dart';
import 'package:whatsup1to1/utils/constants/app_constants.dart';
import 'package:whatsup1to1/utils/constants/assets_manager.dart';
import 'package:whatsup1to1/utils/thems/my_colors.dart';

import '../controllers/user_auth_notifier_provider.dart';

class UserSignUpScreen extends StatefulWidget {
  const UserSignUpScreen({Key? key}) : super(key: key);

  @override
  State<UserSignUpScreen> createState() => _UserSignUpScreenState();
}

class _UserSignUpScreenState extends State<UserSignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  GlobalKey<FormState> loginInKey = GlobalKey<FormState>();
  var passObscure = true;
  File? image;

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void selectImage() async {
    image = await pickImageFromGallery(context);
    setState(() {});
  }

  signUp(WidgetRef ref) async {
    if (loginInKey.currentState!.validate()) {
      if (image != null) {

        UserModel userModel = UserModel();
        userModel=userModel.copyWith(
          name: _nameController.text.trim(),
          email: _emailController.text.trim(),
          phone: _phoneController.text.trim(),
        );

        final userProvider = ref.watch(userAuthNotifierProvider);
        userProvider.setUserObject(userModel);
        userProvider.setPassword(_passController.text.trim());
        userProvider.setProfileImage(image!);
        Navigator.pushNamed(context, AppRoutes.userAccountTypeScreen);

      }else{
        showToast(msg: "Select the profile Image");
      }
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
                              Navigator.pushNamed(
                                  context, AppRoutes.userLoginScreen);
                            },
                            child: Text(
                              S.of(context).SKIP,
                              style: getRegularStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                            ))
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                              S.of(context).Sign_Up_title,
                              style: getSemiBoldStyle(
                                  fontSize: 25.sp,
                                  color: Theme.of(context).colorScheme.secondary),
                            ),
                          ],
                        ),
                        SizedBox(width: 20.w,),
                        Center(
                          child: Stack(
                            children: [
                              SizedBox(
                                height: 136.h,
                                width: 136.w,
                              ),
                              image == null
                                  ? CircleAvatar(
                                radius: 65.r,
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer
                                    .withOpacity(0.5),
                                backgroundImage: AssetImage(AppAssets.personImg),)
                                  : CircleAvatar(
                                radius: 65.r,
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer
                                    .withOpacity(0.5),
                                backgroundImage: FileImage(
                                  image!,
                                ),
                              ),
                              Positioned(
                                bottom: 10.h,
                                left: 95.w,
                                child: GestureDetector(
                                  onTap: selectImage,
                                  child: CircleAvatar(
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .primary, //Theme.of(context).colorScheme.secondary,
                                    radius: 15.r,
                                    child:  Center(
                                      child: Icon(
                                        Icons.edit_outlined,
                                        color: MyColors.white,
                                        size: 20.h,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Form(
                      key: loginInKey,
                      child: Column(
                        children: [
                          CustomTextField(
                              controller: _nameController,
                              validatorFn: uNameValidator,
                              onChanged: (val) {},
                              onFieldSubmitted: (val) {},
                              obscure: false,
                              labelText: S.of(context).Name),
                          CustomTextField(
                              controller: _emailController,
                              validatorFn: emailValidator,
                              onChanged: (val) {},
                              onFieldSubmitted: (val) {},
                              obscure: false,
                              labelText: S.of(context).Email),
                          CustomTextField(
                              controller: _phoneController,
                              validatorFn: phoneValidator,
                              inputType: TextInputType.phone,
                              onChanged: (val) {},
                              onFieldSubmitted: (val) {},
                              obscure: false,
                              labelText: S.of(context).Phone),
                          CustomTextFieldWithIcon(
                              controller: _passController,
                              validatorFn: passValidator,
                              onChanged: (val) {},
                              onFieldSubmitted: (val) {},
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
                    SizedBox(
                      height: 20.h,
                    ),
                    Consumer(
                      builder: (BuildContext context, WidgetRef ref, Widget? child) {
                        return CustomButton(
                            onPressed: () {
                              signUp(ref);
                            },
                            buttonText: S.of(context).SIGN_UP_button);
                      }
                    ),//S.of(context).Start_Shopping),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 1.h,
                          width: 100.w,
                          color: Theme.of(context).colorScheme.secondaryContainer,
                        ),
                        Text(
                          S.of(context).Or_sign_up_with,
                          style: getMediumStyle(
                              fontSize: 12.sp,
                              color: Theme.of(context).colorScheme.tertiary),
                        ),
                        Container(
                          height: 1.h,
                          width: 100.w,
                          color: Theme.of(context).colorScheme.secondaryContainer,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
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
