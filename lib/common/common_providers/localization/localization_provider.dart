import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'language_model.dart';
import 'localization_constants.dart';

final locallizationCtrProvider = ChangeNotifierProvider.autoDispose<LocallizationController>((ref) {
  return LocallizationController();
});
class LocallizationController extends ChangeNotifier{

  int _index = 0;
  int get index => _index;
  setIndex(int status){
    _index = status;
    setLocale();
    notifyListeners();
  }

  List<LanguageModel> _languages = LocalizationConstants.languages;
  List<LanguageModel> get languages => _languages;

  Locale _locale = Locale(
      LocalizationConstants.languages[0].languageCode,
      LocalizationConstants.languages[0].countryCode
  );
  Locale get locale => _locale;

  setLocale(){
    _locale = Locale(
        LocalizationConstants.languages[index].languageCode,
        LocalizationConstants.languages[index].countryCode
    );
    notifyListeners();
  }
}