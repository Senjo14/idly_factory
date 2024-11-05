import 'dart:convert';
import 'package:http/http.dart' as http;

class OnboardingService {

  // Splash Screen
  Future<String> fetchSplashImage() async {
    final response = await http.get(Uri.parse('API Link For Splash Screen'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      String imageUrl = data['imageUrl'];
      if (imageUrl.startsWith('http://') || imageUrl.startsWith('https://')) {
        return imageUrl;
      } else {
        return 'assets/images/onboard_images/factory_logo.jpg';
      }
    } else {
      throw Exception('Failed to load splash image');
    }
  }
}
