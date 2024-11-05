import 'dart:convert';
import 'package:idly_factory/core/export.dart';
import 'package:http/http.dart' as http;


class ApiResponse {
  final bool success;
  final String? message;

  ApiResponse({required this.success, this.message});
}

class ApiService {
  static const String apiUrl = 'https://user-checking-1.onrender.com/api/v1/register';

  static Future<ApiResponse> signup({
    required String name,
    required String email,
    required bool receiveSpecialOffers,
    String? dob,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'name': name,
          'email': email,
          'receive_special_offers': receiveSpecialOffers,
          'dob': dob,
        }),
      );

      print("Response Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      // Handling HTTP status codes
      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        return ApiResponse(
          success: responseBody['success'] ?? false,
          message: responseBody['message'] ?? "Sign up successful.",
        );
      } else {
        // Handle client or server errors
        final responseBody = json.decode(response.body);
        switch (response.statusCode) {
          case 400:
            throw BadRequestException(responseBody['message'] ?? "Bad request.");
          case 401:
            throw UnauthorizedException(responseBody['message'] ?? "Unauthorized access.");
          case 404:
            throw NotFoundException(responseBody['message'] ?? "Not found.");
          case 500:
            throw ServerException(responseBody['message'] ?? "Internal server error.");
          default:
            throw AppException("Unexpected error: ${response.statusCode}");
        }
      }
    } catch (e) {
      // Handling general exceptions
      if (e is AppException) {
        rethrow; // Rethrow known AppExceptions
      } else {
        throw NetworkException("Network error occurred: $e");
      }
    }
  }
}
