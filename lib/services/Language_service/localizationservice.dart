import 'dart:ui';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationService extends Translations {
  static const Locale fallbackLocale = Locale('en', 'US');
  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'languageRegion': 'Language Region',
      'cCEnglish': 'Canadian English',
      'countryCanada': 'Canada',
    },
    'fr': {
      'languageRegion': 'Région linguistique',
      'cCEnglish': 'Anglais canadien',
      'countryCanada': 'Canada',
    },
    'en_usa': {
      'languageRegion': 'Language Region',
      'cCEnglish': 'USA English',
      'countryCanada': 'Canada',
    },
  };

  static const String languageKey = 'selected_language';

  static Future<void> saveLanguage(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(languageKey, languageCode);
  }

  static Future<Locale> loadSavedLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedLanguageCode = prefs.getString(languageKey);

    if (savedLanguageCode != null) {
      switch (savedLanguageCode) {
        case 'en':
          return const Locale('en', 'US');
        case 'fr':
          return const Locale('fr', 'FR');
        case 'usa':
          return const Locale('en', 'US');
        default:
          return fallbackLocale;
      }
    }
    return fallbackLocale;
  }

  @override
  Map<String, Map<String, String>> get keys => _localizedValues;
}
