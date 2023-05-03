import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsup1to1/app/user_auth/controllers/auth_controller.dart';
import 'package:whatsup1to1/app/user_auth/controllers/user_auth_notifier_provider.dart';
import 'package:whatsup1to1/app/user_auth/data/models/address_model.dart';
import 'package:whatsup1to1/app/user_auth/data/models/attachment_model.dart';
import 'package:whatsup1to1/app/user_auth/data/models/seller_sub_model.dart';
import 'package:whatsup1to1/app/user_auth/data/models/user_model.dart';
import 'package:whatsup1to1/app/user_auth/widgets/attached_file.dart';
import 'package:whatsup1to1/common/common_libs.dart';
import 'package:whatsup1to1/common/widgets/CustomTextFields.dart';
import 'package:whatsup1to1/common/widgets/custom_button.dart';
import 'package:whatsup1to1/common/widgets/toasts_widgets.dart';
import 'package:whatsup1to1/common/widgets/validator.dart';
import 'package:whatsup1to1/generated/l10n.dart';
import 'package:whatsup1to1/routes/route_manager.dart';
import 'package:whatsup1to1/utils/constants/app_constants.dart';
import 'package:whatsup1to1/utils/constants/assets_manager.dart';
import 'package:whatsup1to1/utils/loading.dart';
import 'package:uuid/uuid.dart';
import 'package:file_picker/file_picker.dart';
import 'package:whatsup1to1/utils/thems/my_colors.dart';


class SellerMainStoreAddress extends StatefulWidget {
  const SellerMainStoreAddress({Key? key}) : super(key: key);

  @override
  State<SellerMainStoreAddress> createState() => _SellerMainStoreAddressState();
}

class _SellerMainStoreAddressState extends State<SellerMainStoreAddress> {
  final TextEditingController _nameController = TextEditingController();

  GlobalKey<FormState> mainStoreKey = GlobalKey<FormState>();

  final TextEditingController _townCtr = TextEditingController();

  final TextEditingController _phoneCtr = TextEditingController();

  final TextEditingController _pinCtr = TextEditingController();

  final TextEditingController _flatHouseAddCtr = TextEditingController();

  final TextEditingController _areaCtr = TextEditingController();

  bool isUploading = false;
  List<AttachmentModel>? uploadFiles = [];
  PlatformFile? pickedFile;

  storeData(WidgetRef ref) async {
    if (mainStoreKey.currentState!.validate() && uploadFiles!.isNotEmpty) {
      final String addressId = const Uuid().v1();

      AddressModel addressModel = AddressModel(
          addressId: addressId,
          town: _townCtr.text.trim(),
          mobileNo: _phoneCtr.text.trim(),
          pinCode: _pinCtr.text.trim(),
          flatHouseBuilding: _flatHouseAddCtr.text.trim(),
          areaColonyStreet: _areaCtr.text.trim(),
          addressType: "Default");

      SellerSubModel sellerSubModel=SellerSubModel(
        storeName: _nameController.text.trim(),
        storeAddress: addressModel,
        attachments: uploadFiles,
        productCount: 0,
      );

      final userProvider = ref.watch(userAuthNotifierProvider);

      UserModel userModel = userProvider.getUserObject;
      userModel = userModel.copyWith(
        sellerSubModel: sellerSubModel,
      );

      userProvider.setUserObject(userModel);
      // print(userProvider.getUserObject.toJson());
      Navigator.pushNamed(context, AppRoutes.sellerSelectTypeScreen);
    }else{
      showSnakBar(context, "Kindly upload the attachments");
    }
  }


  Future selectFile(WidgetRef ref) async {
    setState(() {
      isUploading = true;
    });

    final result = await FilePicker.platform.pickFiles();
    if (result == null) {
      return;
    }
    final file = File(result.files.first.path!);
    String fileName = result.files.first.name;
    if(fileName.length>11){
      fileName="${fileName.substring(0,10)}.${result.files.first.extension!}";
    }
    final authCtr = ref.read(authControllerProvider.notifier);
    String fileUrl = await authCtr.uploadFileAttachment(file:file,fileName: fileName,context: context);

    if(fileUrl!=''){
      uploadFiles?.add(AttachmentModel(fileName: fileName, fileUrl: fileUrl));
    }

    setState(() {
      isUploading = false;
    });
  }

  @override
  void dispose() {
    _townCtr.dispose();
    _phoneCtr.dispose();
    _pinCtr.dispose();
    _flatHouseAddCtr.dispose();
    _areaCtr.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
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
                  height: 20.h,
                ),
                Form(
                  key: mainStoreKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).Add_Store_Name,
                        style: getSemiBoldStyle(
                            fontSize: 14.sp,
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextField(
                          controller: _nameController,
                          validatorFn: commonValidator,
                          onChanged: (val) {},
                          onFieldSubmitted: (val) {},
                          obscure: false,
                          labelText: S.of(context).Name),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        S.of(context).Add_Store_Address,
                        style: getSemiBoldStyle(
                            fontSize: 14.sp,
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextField(
                          controller: _townCtr,
                          validatorFn: commonValidator,
                          onChanged: (val) {},
                          onFieldSubmitted: (val) {},
                          obscure: false,
                          labelText: S.of(context).Town_city),
                      CustomTextField(
                          controller: _phoneCtr,
                          validatorFn: phoneValidator,
                          onChanged: (val) {},
                          onFieldSubmitted: (val) {},
                          obscure: false,
                          labelText: S.of(context).Mobile_Number),
                      CustomTextField(
                          controller: _pinCtr,
                          validatorFn: commonValidator,
                          onChanged: (val) {},
                          onFieldSubmitted: (val) {},
                          obscure: false,
                          labelText: S.of(context).Pin_Code),
                      CustomTextField(
                          controller: _flatHouseAddCtr,
                          validatorFn: commonValidator,
                          onChanged: (val) {},
                          onFieldSubmitted: (val) {},
                          obscure: false,
                          labelText: S.of(context).flat_house_No_building),
                      CustomTextField(
                          controller: _areaCtr,
                          validatorFn: commonValidator,
                          onChanged: (val) {},
                          onFieldSubmitted: (val) {},
                          obscure: false,
                          labelText: S.of(context).area_colony_street),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  S.of(context).Attachments,
                  style: getSemiBoldStyle(
                      fontSize: 14.sp,
                      color: Theme.of(context).colorScheme.secondary),
                ),
                Consumer(
                  builder: (context,ref,child) {
                    return UploadButton(
                      isUploading: isUploading,
                      onTap:()=> selectFile(ref),
                    );
                  }
                ),
                if (uploadFiles!.isNotEmpty)
                  SizedBox(
                    height: 80.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: uploadFiles!.length,
                        itemBuilder: (context, index) {
                          return AttachedFile(
                            filename: uploadFiles![index].fileName!,
                          );
                        }),
                  ),
                Consumer(
                  builder: (context,ref,child) {
                    return CustomButton(
                        fontSize: 14.sp,
                        onPressed: () {
                          storeData(ref);
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
        ),
      ),
    );
  }
}

class UploadButton extends StatelessWidget {
  const UploadButton({
    super.key,
    required this.isUploading,
    required this.onTap,
  });

  final bool isUploading;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.h),
      child: RawMaterialButton(
        elevation: 0,
        fillColor: Theme.of(context).colorScheme.tertiary,
        //splashColor: Colors.greenAccent,
        onPressed: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: SizedBox(
          height: 30.h,
          width: 100.w,
          child: Padding(
            padding: EdgeInsets.all(4.0.h),
            child: isUploading
                ? LoadingWidget(color: MyColors.white,)
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.upload_outlined,
                          color: Color(0xFFBFBFBF)),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0.w),
                        child: Text(
                          S.of(context).Upload,
                          style: getMediumStyle(
                              fontSize: 12.sp, color: MyColors.white),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
