import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsup1to1/app/user_auth/controllers/auth_controller.dart';
import 'package:whatsup1to1/app/user_auth/controllers/user_auth_notifier_provider.dart';
import 'package:whatsup1to1/app/user_auth/data/models/user_model.dart';
import 'package:whatsup1to1/common/common_libs.dart';
import 'package:whatsup1to1/common/widgets/CustomTextFields.dart';
import 'package:whatsup1to1/common/widgets/DropDownWidget.dart';
import 'package:whatsup1to1/common/widgets/custom_button.dart';
import 'package:whatsup1to1/common/widgets/toasts_widgets.dart';
import 'package:whatsup1to1/generated/l10n.dart';
import 'package:whatsup1to1/routes/route_manager.dart';
import 'package:whatsup1to1/utils/constants/app_constants.dart';
import 'package:whatsup1to1/utils/constants/assets_manager.dart';

class UserAccountTypeScreen extends StatefulWidget {
  const UserAccountTypeScreen({Key? key}) : super(key: key);

  @override
  State<UserAccountTypeScreen> createState() => _UserAccountTypeScreenState();
}

class _UserAccountTypeScreenState extends State<UserAccountTypeScreen> {
  String? type;

  List<String> typeItems = ['Seller', 'Customer'];

  selectAccountType(WidgetRef ref) async {
    if (type != null) {
      final userProvider = ref.watch(userAuthNotifierProvider);
      UserModel userModel = userProvider.getUserObject;
      userModel = userModel.copyWith(
        accountType: type,
      );

      userProvider.setUserObject(userModel);
      print(userProvider.getUserObject);

      if (type == "Seller") {
        Navigator.pushNamed(context, AppRoutes.sellerMainStoreAddressScreen);
      } else if (type == "Customer") {
        final authCtr = ref.read(authControllerProvider.notifier);
        await authCtr.registerCustomerWithEmailAndPassword(
          context: context,
          ref: ref,
        );
      }
    } else {
      showSnakBar(context, "Please select account type");
    }
  }

  @override
  void dispose() {
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
                        const SizedBox()
                      ],
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                    Text(
                      S.of(context).Select_Account_Type,
                      style: getSemiBoldStyle(
                          fontSize: 25.sp,
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    DropDownWidget(
                        value: type,
                        valueItems: typeItems,
                        onChanged: (String? newValue) {
                          setState(() {
                            type = newValue!;
                          });
                        },
                        hintText: S.of(context).Account_Type),
                    SizedBox(
                      height: 20.h,
                    ),
                    Consumer(builder: (context, ref, child) {
                      return CustomButton(
                          onPressed: () {
                            selectAccountType(ref);
                          },
                          isLoading: ref.watch(authControllerProvider),
                          buttonText: S.of(context).Proceed);
                    }),
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
