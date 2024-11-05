
import 'package:idly_factory/core/export.dart';


enum Language { CanadaEnglish, CanadaFrench, USAEnglish }

class LanguageRegionController extends GetxController {
  Rx<Language?> selectedLanguage = Rx<Language?>(null);
  RxBool isLoading = false.obs;
  RxBool isShow = false.obs;

  Future<void> confirmLanguageSelection() async {
    if (selectedLanguage.value == null) return;

    isLoading.value = true;

    Locale locale;
    switch (selectedLanguage.value) {
      case Language.CanadaEnglish:
        locale = const Locale('en', 'CA');
        break;
      case Language.CanadaFrench:
        locale = const Locale('fr', 'CA');
        break;
      case Language.USAEnglish:
        locale = const Locale('en', 'US');
        break;
      default:
        locale = const Locale('en', 'CA');
    }

    Get.updateLocale(locale);
    await Future.delayed(const Duration(seconds: 2));
    Get.offNamed(AppRoutes.mainPage);

    isLoading.value = false;
  }

  void updateSelectedLanguage(Language? value) {
    selectedLanguage.value = value;
    isShow.value = true;
  }
}
