import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = "https://your-api-url.com";

  // Request OTP for sign-in using email
  Future<Map<String, dynamic>> requestOtp(String email) async {
    final response = await http.post(
      Uri.parse('$baseUrl/request-otp'),
      body: {'email': email},
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to request OTP");
    }
  }

  // Verify the entered OTP
  Future<Map<String, dynamic>> verifyOtp(String email, String otp) async {
    final response = await http.post(
      Uri.parse('$baseUrl/verify-otp'),
      body: {
        'email': email,
        'otp': otp,
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("OTP verification failed");
    }
  }

  // Sign out
  Future<void> signOut(String token) async {
    final response = await http.post(
      Uri.parse('$baseUrl/signout'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to sign out");
    }
  }
}
