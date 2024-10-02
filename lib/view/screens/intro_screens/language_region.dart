import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idly_factory/controllers/intro_controller/language_region.dart';

import '../../../constants/images.dart';
import '../../../constants/strings.dart';
import '../../../constants/text_styles.dart';

class LanguageRegion extends StatelessWidget {
  LanguageRegion({super.key});

  final LanguageController languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.languageRegion.tr,
          style: AppTextStyles.heading2,
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ImageIcon(AssetImage(Assets.questionMarkRounded)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.languageRegionTitle.tr,  // Removed const
              style: AppTextStyles.heading1,
            ),
            const SizedBox(height: 10),
            Text(
              AppStrings.languageRegionWeUse.tr,  // Removed const
              style: AppTextStyles.smallLines,
            ),
            const SizedBox(height: 10),
            Text(
              AppStrings.countryCanada.tr,  // Removed const
              style: AppTextStyles.heading1,
            ),

            Obx(() => ListTile(
              title: Text(AppStrings.cCEnglish.tr, style: AppTextStyles.heading2),
              subtitle: Text(AppStrings.cCEnglishCAN.tr, style: AppTextStyles.smallLines),
              leading: Radio<Locale>(
                value: const Locale('en', 'CA'),
                groupValue: languageController.selectedLanguage.value,
                onChanged: (Locale? value) {
                  if (value != null) {
                    languageController.changeLanguage('en_CA');
                  }
                },
                activeColor: Colors.red,
              ),
              onTap: () {
                languageController.changeLanguage('en_CA');
              },
            )),

// For Canadian French
            Obx(() => ListTile(
              title: Text(AppStrings.cCFrench.tr, style: AppTextStyles.heading2),
              subtitle: Text(AppStrings.cCFrench.tr, style: AppTextStyles.smallLines),
              leading: Radio<Locale>(
                value: const Locale('fr', 'CA'),
                groupValue: languageController.selectedLanguage.value,
                onChanged: (Locale? value) {
                  if (value != null) {
                    languageController.changeLanguage('fr_CA');
                  }
                },
                activeColor: Colors.red,
              ),
              onTap: () {
                languageController.changeLanguage('fr_CA');
              },
            )),

// For USA English
            Obx(() => ListTile(
              title: Text(AppStrings.cCEnglish.tr, style: AppTextStyles.heading2),
              subtitle: Text(AppStrings.cCEnglishUSA.tr, style: AppTextStyles.smallLines),
              leading: Radio<Locale>(
                value: const Locale('en', 'US'),
                groupValue: languageController.selectedLanguage.value,
                onChanged: (Locale? value) {
                  if (value != null) {
                    languageController.changeLanguage('en_US');
                  }
                },
                activeColor: Colors.red,
              ),
              onTap: () {
                languageController.changeLanguage('en_US');
              },
            )),

            const Spacer(),

            // Continue Button
            Obx(() => SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  backgroundColor: languageController.isShow.value
                      ? Colors.red
                      : Colors.grey,
                ),
                onPressed: languageController.isLoading.value
                    ? null
                    : () async {
                  languageController.isLoading.value = true;
                  await Future.delayed(const Duration(seconds: 2));
                  Get.offNamed('/bottomNav');
                  languageController.isLoading.value = false;
                },
                child: languageController.isLoading.value
                    ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 5.0,
                  ),
                )
                    : Text(
                  AppStrings.languageButton.tr,
                  style: AppTextStyles.elevatedButtonText,
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
