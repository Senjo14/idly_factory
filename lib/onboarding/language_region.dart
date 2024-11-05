
import 'package:idly_factory/core/export.dart';

class LanguageRegion extends StatelessWidget {
  const LanguageRegion({super.key});

  @override
  Widget build(BuildContext context) {
    final LanguageRegionController controller = Get.put(LanguageRegionController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Language and Region", style: AppTextStyle.mainHeader),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.all(10.w),
            child: const ImageIcon(AssetImage(Assets.questionMarkRounded)),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What's your region and language",
              style: AppTextStyle.sectionTitlesH3,
            ),
            10.verticalSpace,
            Text(
              'We use this info to show you offers in your area.',
              style: AppTextStyle.bodyText,
            ),
            10.verticalSpace,
            Text('Canada', style: AppTextStyle.sectionTitlesH3),
            10.verticalSpace,
            _buildListTile(
              controller: controller,
              language: Language.CanadaEnglish,
              title: "English",
              subtitle: 'English',
            ),
            _buildListTile(
              controller: controller,
              language: Language.CanadaFrench,
              title: 'French',
              subtitle: 'French',
            ),
            20.verticalSpace,
            Text("USA", style: AppTextStyle.sectionTitlesH3),
            _buildListTile(
              controller: controller,
              language: Language.USAEnglish,
              title: "English",
              subtitle: "English",
            ),
            const Spacer(),
            _buildConfirmButton(controller),
          ],
        ),
      ),
    );
  }

  Widget _buildConfirmButton(LanguageRegionController controller) {
    return Obx(() => SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.r),
          ),
          backgroundColor: controller.isShow.value ? Colors.red : Colors.grey,
        ),
        onPressed: controller.isLoading.value || !controller.isShow.value ? null : controller.confirmLanguageSelection,
        child: controller.isLoading.value
            ? SizedBox(
          height: 20.h,
          width: 20.w,
          child: const CircularProgressIndicator(
            color: Colors.red,
            strokeWidth: 5.0,
          ),
        )
            : Text(AppStrings.done,
          style: AppTextStyle.buttonsAction,
        ),
      ),
    ));
  }

  Widget _buildListTile({
    required LanguageRegionController controller,
    required Language language,
    required String title,
    required String subtitle,
  }) {
    return Obx(() => ListTile(
      title: Text(title, style: AppTextStyle.bodyText),
      subtitle: Text(subtitle, style: AppTextStyle.smallText),
      leading: Radio<Language>(
        activeColor: Colors.red,
        value: language,
        groupValue: controller.selectedLanguage.value,
        onChanged: (Language? value) {
          controller.updateSelectedLanguage(value);
        },
      ),
      onTap: () {
        controller.updateSelectedLanguage(language);
      },
    ));
  }
}
