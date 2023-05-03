import 'language_model.dart';

class LocalizationConstants{

  static const COUNTRY_CODE = "country_code";
  static const LANGUAGE_CODE = "language_code";


  static List<LanguageModel> languages = [
    LanguageModel("en.png", "US", "en", "English"),
    LanguageModel("ar.png", "KSA", "ar", "Arabic"),
  ];
}