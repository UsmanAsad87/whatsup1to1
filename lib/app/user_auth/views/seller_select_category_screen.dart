import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsup1to1/app/user_auth/controllers/auth_controller.dart';
import 'package:whatsup1to1/app/user_auth/controllers/user_auth_notifier_provider.dart';
import 'package:whatsup1to1/app/user_auth/data/models/create_category_model.dart';
import 'package:whatsup1to1/app/user_auth/data/models/seller_sub_model.dart';
import 'package:whatsup1to1/app/user_auth/data/models/user_model.dart';
import 'package:whatsup1to1/common/common_libs.dart';
import 'package:whatsup1to1/common/widgets/DropDownWidget.dart';
import 'package:whatsup1to1/common/widgets/custom_button.dart';
import 'package:whatsup1to1/common/widgets/toasts_widgets.dart';
import 'package:whatsup1to1/core/enums/category_type.dart';
import 'package:whatsup1to1/generated/l10n.dart';
import 'package:whatsup1to1/routes/route_manager.dart';
import 'package:whatsup1to1/utils/constants/app_constants.dart';
import 'package:whatsup1to1/utils/constants/assets_manager.dart';
import 'package:whatsup1to1/utils/loading.dart';

class SellerSelectCategoryScreen extends ConsumerStatefulWidget {
  const SellerSelectCategoryScreen({Key? key}) : super(key: key);

  @override
 ConsumerState<SellerSelectCategoryScreen> createState() => _SellerSelectCategoryScreenState();
}

class _SellerSelectCategoryScreenState extends ConsumerState<SellerSelectCategoryScreen> {
  String? category;

  List<String> listCategory=["cat","dog","horse"];

  @override
  void dispose() {
    super.dispose();
  }

  selectCategory(WidgetRef ref) async {
    if (category != null) {
      final userProvider = ref.watch(userAuthNotifierProvider);
      UserModel userModel = userProvider.getUserObject;
      SellerSubModel sellerSubModel =userModel.sellerSubModel!;
      sellerSubModel=sellerSubModel.copyWith(
        selectedCategory: category!,
      );

      userModel=userModel.copyWith(
        sellerSubModel: sellerSubModel,
      );
      userProvider.setUserObject(userModel);


      final authCtr = ref.read(authControllerProvider.notifier);
      await authCtr.registerSellerWithEmailAndPassword(
        context: context,
        ref: ref,
      );

      
    }else{
      showSnakBar(context,"Please select a category");
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
                    Image.asset(
                      AppAssets.logo,
                      width: 115.w,
                      height: 42.h,
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                    Text(
                      S.of(context).Select_Product_Category,
                      style: getSemiBoldStyle(
                          fontSize: 25.sp,
                          color: Theme.of(context).colorScheme.secondary),
                    ),

                    SizedBox(
                      height: 30.h,
                    ),


                    DropDownWidget(
                      hintText: S.of(context).Category,
                      value: category,
                      valueItems: listCategory,
                      onChanged: (String? newValue) {
                        setState(() {
                         category = newValue!;
                        });
                      },
                    ),


                    SizedBox(
                      height: 20.h,
                    ),
                    Consumer(
                      builder: (context,ref,child) {
                        return CustomButton(
                            onPressed: () {
                              selectCategory(ref);
                            },
                            isLoading: ref.watch(authControllerProvider),
                            buttonText: S.of(context).DONE);
                      }
                    ),
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
