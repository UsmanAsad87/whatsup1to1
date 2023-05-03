

import 'package:whatsup1to1/app/user_auth/data/models/address_model.dart';
import 'package:whatsup1to1/app/user_auth/data/models/attachment_model.dart';
import 'package:whatsup1to1/app/user_auth/data/models/create_category_model.dart';

class SellerSubModel {
  String? storeName;
  String? selectedType;
  String? selectedCategory;
  AddressModel? storeAddress;
  List<AttachmentModel>? attachments;
  int? productCount;

  SellerSubModel({
    this.storeName,
    this.selectedType,
    this.selectedCategory,
    this.storeAddress,
    this.attachments,
    this.productCount,
  });

  factory SellerSubModel.fromJson(Map<String, dynamic> json) {
    return SellerSubModel(
      storeName: json['storeName'] as String?,
      selectedType: json['selectedType'] as String?,
      selectedCategory: json['selectedCategory']  as String?,
      storeAddress: json['storeAddress'] == null
          ? null
          : AddressModel.fromJson(json['storeAddress'] as Map<String, dynamic>),
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => AttachmentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      productCount: json['productCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'storeName': this.storeName,
      'selectedType': this.selectedType,
      'selectedCategory': this.selectedCategory,
      'storeAddress':
          this.storeAddress == null ? null : this.storeAddress?.toJson(),
      'attachments': this.attachments?.map((e) => e.toJson()).toList(),
      'productCount': this.productCount,
    };
  }

  SellerSubModel copyWith({
    String? storeName,
    String? selectedType,
    String? selectedCategory,
    AddressModel? storeAddress,
    List<AttachmentModel>? attachments,
    int? productCount,
  }) {
    return SellerSubModel(
      storeName: storeName ?? this.storeName,
      selectedType: selectedType ?? this.selectedType,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      storeAddress: storeAddress ?? this.storeAddress,
      attachments: attachments ?? this.attachments,
      productCount: productCount ?? this.productCount,
    );
  }
}
