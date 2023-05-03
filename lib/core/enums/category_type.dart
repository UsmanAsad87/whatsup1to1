enum CategoryType {
  product('product'),
  service('service');

  const CategoryType(this.type);
  final String type;
}

extension convertTweet on String{
  CategoryType toCategoryTypeEnum(){
    switch(this) {
      case 'product':
        return CategoryType.product;

      case 'service':
        return CategoryType.service;

      default:
        return CategoryType.product;
    }
  }
}