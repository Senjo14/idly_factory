import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:idly_factory/controllers/signup_login_controllers/signin_controllers.dart';
import 'package:idly_factory/services/Language_service/mytranslations.dart';

import 'package:idly_factory/services/auth_service/signin_service/authService.dart';
import 'core/export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Get.putAsync(() => AuthService().init());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService authService = Get.find();
    return ScreenUtilInit(
      //designSize: ScreenUtil.defaultSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          translations: MyTranslations(),
          locale: Locale('en', 'CA'),
          fallbackLocale: Locale('en', 'US'),
          debugShowCheckedModeBanner: false,
          initialRoute: authService.isSignedIn
              ? AppRoutes.mainPage
              : AppRoutes.splashScreen,
          getPages: AppRoutes.routes,
        );
      },
    );
  }
}
