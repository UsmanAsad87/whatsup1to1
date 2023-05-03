class AddressModel{
  String addressId;
  String town;
  String mobileNo;
  String pinCode;
  String flatHouseBuilding;
  String areaColonyStreet;
  String addressType;

//<editor-fold desc="Data Methods">
  AddressModel({
    required this.addressId,
    required this.town,
    required this.mobileNo,
    required this.pinCode,
    required this.flatHouseBuilding,
    required this.areaColonyStreet,
    required this.addressType,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AddressModel &&
          runtimeType == other.runtimeType &&
          addressId == other.addressId &&
          town == other.town &&
          mobileNo == other.mobileNo &&
          pinCode == other.pinCode &&
          flatHouseBuilding == other.flatHouseBuilding &&
          areaColonyStreet == other.areaColonyStreet &&
          addressType == other.addressType);

  @override
  int get hashCode =>
      addressId.hashCode ^
      town.hashCode ^
      mobileNo.hashCode ^
      pinCode.hashCode ^
      flatHouseBuilding.hashCode ^
      areaColonyStreet.hashCode ^
      addressType.hashCode;

  @override
  String toString() {
    return 'AddressModel{' +
        ' addressId: $addressId,' +
        ' town: $town,' +
        ' mobileNo: $mobileNo,' +
        ' pinCode: $pinCode,' +
        ' flatHouseBuilding: $flatHouseBuilding,' +
        ' areaColonyStreet: $areaColonyStreet,' +
        ' addressType: $addressType,' +
        '}';
  }

  AddressModel copyWith({
    String? addressId,
    String? town,
    String? mobileNo,
    String? pinCode,
    String? flatHouseBuilding,
    String? areaColonyStreet,
    String? addressType,
  }) {
    return AddressModel(
      addressId: addressId ?? this.addressId,
      town: town ?? this.town,
      mobileNo: mobileNo ?? this.mobileNo,
      pinCode: pinCode ?? this.pinCode,
      flatHouseBuilding: flatHouseBuilding ?? this.flatHouseBuilding,
      areaColonyStreet: areaColonyStreet ?? this.areaColonyStreet,
      addressType: addressType ?? this.addressType,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'addressId': this.addressId,
      'town': this.town,
      'mobileNo': this.mobileNo,
      'pinCode': this.pinCode,
      'flatHouseBuilding': this.flatHouseBuilding,
      'areaColonyStreet': this.areaColonyStreet,
      'addressType': this.addressType,
    };
  }

  factory AddressModel.fromJson(Map<String, dynamic> map) {
    return AddressModel(
      addressId: map['addressId'] as String,
      town: map['town'] as String,
      mobileNo: map['mobileNo'] as String,
      pinCode: map['pinCode'] as String,
      flatHouseBuilding: map['flatHouseBuilding'] as String,
      areaColonyStreet: map['areaColonyStreet'] as String,
      addressType: map['addressType'] as String,
    );
  }

//</editor-fold>
}