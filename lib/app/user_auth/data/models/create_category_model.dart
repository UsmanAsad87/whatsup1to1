
import 'package:whatsup1to1/core/enums/category_type.dart';

class CategoryModel {
  final String categoryId;
  final CategoryType categoryType;
  final String image;
  final String name;
  final DateTime createdAt;

//<editor-fold desc="Data Methods">
  CategoryModel({
    required this.categoryId,
    required this.categoryType,
    required this.image,
    required this.name,
    required this.createdAt,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryModel &&
          runtimeType == other.runtimeType &&
          categoryId == other.categoryId &&
          categoryType == other.categoryType &&
          image == other.image &&
          name == other.name);

  @override
  int get hashCode =>
      categoryId.hashCode ^
      categoryType.hashCode ^
      image.hashCode ^
      name.hashCode;

  @override
  String toString() {
    return 'CreateCategoryModel{' +
        ' categoryId: $categoryId,' +
        ' categoryType: $categoryType,' +
        ' image: $image,' +
        ' name: $name,' +
        '}';
  }

  CategoryModel copyWith({
    String? categoryId,
    CategoryType? categoryType,
    String? image,
    String? name,
  }) {
    return CategoryModel(
      categoryId: categoryId ?? this.categoryId,
      categoryType: categoryType ?? this.categoryType,
      image: image ?? this.image,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'categoryId': this.categoryId,
      'categoryType': this.categoryType.type,
      'image': this.image,
      'name': this.name,
      'createdAt': this.createdAt.millisecondsSinceEpoch,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      categoryId: map['categoryId'] as String,
      categoryType: (map['categoryType'] as String).toCategoryTypeEnum(),
      image: map['image'] as String,
      name: map['name'] as String,
      createdAt: map['createdAt'] != null?  DateTime.fromMillisecondsSinceEpoch(map['createdAt']): DateTime.now(),
    );
  }

//</editor-fold>
}
