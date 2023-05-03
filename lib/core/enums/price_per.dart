enum PricePer {
  hour('hour'),
  day('day'),
  none('none'),
  lifetime('lifetime');

  const PricePer(this.type);
  final String type;
}

extension convertTweet on String{
  PricePer toPricePerTypeEnum(){
    switch(this) {
      case 'hour':
        return PricePer.hour;

      case 'day':
        return PricePer.day;

      case 'lifetime':
        return PricePer.lifetime;


      default:
        return PricePer.none;
    }
  }
}