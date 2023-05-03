import 'package:whatsup1to1/app/user_auth/data/models/seller_sub_model.dart';

class UserModel {
  String? uid;
  String? name;
  String? email;
  String? phone;
  String? accountType;
  bool? approved;
  bool? activated;
  String? image;
  DateTime? createdAt;
  SellerSubModel? sellerSubModel;
  Map<String, dynamic>? searchTags;
  UserModel({
    this.uid,
    this.name,
    this.email,
    this.phone,
    this.accountType,
    this.approved,
    this.image,
    this.createdAt,
    this.sellerSubModel,
    this.activated,
    this.searchTags,
  });

  UserModel copyWith({
    String? uid,
    String? name,
    String? email,
    String? phone,
    String? accountType,
    bool? approved,
    String? image,
    DateTime? createdAt,
    SellerSubModel? sellerSubModel,
    bool? activated,
    Map<String, dynamic>? searchTags,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      accountType: accountType ?? this.accountType,
      approved: approved ?? this.approved,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
      sellerSubModel: sellerSubModel ?? this.sellerSubModel,
      searchTags: searchTags ?? this.searchTags,
      activated: activated??this.activated
    );
  }

  @override
  String toString() {
    return 'UserModel{uid: $uid, name: $name, email: $email, searchTags: $searchTags, phone: $phone, accountType: $accountType,activated: $activated, approved: $approved, image: $image, createdAt: $createdAt, sellerSubModel: $sellerSubModel}';
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      accountType: json['accountType'] as String?,
      approved: json['approved'] as bool?,
      searchTags: json['searchTags'] as Map<String, dynamic>?,
      activated: json['activated'] as bool?,
      image: json['image'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      sellerSubModel: json['sellerSubModel'] == null
          ? null
          : SellerSubModel.fromJson(
              json['sellerSubModel'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': this.uid,
      'name': this.name,
      'email': this.email,
      'phone': this.phone,
      'accountType': this.accountType,
      'approved': this.approved,
      'image': this.image,
      'activated':this.activated,
      'searchTags':this.searchTags,
      'createdAt': this.createdAt?.toIso8601String(),
      'sellerSubModel':
          this.sellerSubModel == null ? null : this.sellerSubModel!.toJson(),
    };
  }
}
