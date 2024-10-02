import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idly_factory/services/Language_service/localizationservice.dart';
import 'package:idly_factory/view/screens/bottom_nav_screen/bottom_nav.dart';
import 'package:idly_factory/view/screens/intro_screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Locale savedLocale = await LocalizationService.loadSavedLanguage();
  runApp(MyApp(savedLocale: savedLocale));
}

class MyApp extends StatelessWidget {
  final Locale savedLocale;

  const MyApp({super.key, required this.savedLocale});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Idly Factory',
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/bottomNav': (context) => const BottomNav(),
      },
      locale: savedLocale,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
    );
  }
}
