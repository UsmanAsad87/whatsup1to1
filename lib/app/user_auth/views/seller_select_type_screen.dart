import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsup1to1/app/user_auth/data/models/seller_sub_model.dart';
import 'package:whatsup1to1/app/user_auth/data/models/user_model.dart';
import 'package:whatsup1to1/common/common_libs.dart';
import 'package:whatsup1to1/common/widgets/DropDownWidget.dart';
import 'package:whatsup1to1/common/widgets/custom_button.dart';
import 'package:whatsup1to1/generated/l10n.dart';
import 'package:whatsup1to1/routes/route_manager.dart';
import 'package:whatsup1to1/utils/constants/app_constants.dart';
import 'package:whatsup1to1/utils/constants/assets_manager.dart';

import '../../../common/widgets/toasts_widgets.dart';
import '../../../core/enums/category_type.dart';
import '../controllers/user_auth_notifier_provider.dart';

class SellerSelectTypeScreen extends StatefulWidget {
  const SellerSelectTypeScreen({Key? key}) : super(key: key);

  @override
  State<SellerSelectTypeScreen> createState() => _SellerSelectTypeScreenState();
}

class _SellerSelectTypeScreenState extends State<SellerSelectTypeScreen> {
  String? type;
  List<String> typeItems = [
    "Product","Service"
  ];


  @override
  void dispose() {
    super.dispose();
  }

  selectType(WidgetRef ref) async {
      if (type != null) {
        final userProvider = ref.watch(userAuthNotifierProvider);
        UserModel userModel = userProvider.getUserObject;
        SellerSubModel sellerSubModel =userModel.sellerSubModel!;

        CategoryType catType = CategoryType.product;
        if (type == "Service") {
          catType = CategoryType.service;
        }
        sellerSubModel=sellerSubModel.copyWith(
          selectedType: catType.name,
        );

        userProvider.setCategoryType(catType);


        userModel=userModel.copyWith(
          sellerSubModel: sellerSubModel,
        );


        userProvider.setUserObject(userModel);
        Navigator.pushNamed(context, AppRoutes.sellerSelectCategoryScreen);
      }else{
        showSnakBar(context,"Please select a type");
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
                      S.of(context).Select_Type,
                      style: getSemiBoldStyle(
                          fontSize: 25.sp,
                          color: Theme.of(context).colorScheme.secondary),
                    ),

                    SizedBox(
                      height: 30.h,
                    ),
                    DropDownWidget(
                      hintText: S.of(context).Type,
                      value: type,
                      valueItems: typeItems,
                      onChanged: (String? newValue) {
                        setState(() {
                          type = newValue!;
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
                              selectType(ref);
                            },
                            buttonText: S.of(context).Next);
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
