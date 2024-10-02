import 'dart:ui';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LanguageController extends GetxController {
  // Default language set to USA Engitglish
  var selectedLanguage = const Locale('en', 'US').obs;
  var isLoading = false.obs;
  var isShow = true.obs; // Control button visibility based on selection

  // Function to change the language
  void changeLanguage(String localeString) {
    List<String> localeData = localeString.split('_');
    selectedLanguage.value = Locale(localeData[0], localeData[1]);
    isShow.value = true; // Ensure the button becomes active when a language is selected
  }
}
