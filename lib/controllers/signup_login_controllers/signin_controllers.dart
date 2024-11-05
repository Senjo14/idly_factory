import 'package:get/get.dart';
import '../../services/auth_service/signin_service/signin_apiservice.dart';


class SignInController extends GetxController {
  RxBool isSignedIn = false.obs;
  var isOtpSent = false.obs;
  var isOtpVerified = false.obs;
  final ApiService _apiService = ApiService();


  Future<void> requestOtp(String email) async {
    try {
      final result = await _apiService.requestOtp(email);
      if (result['status'] == 'success') {
        isOtpSent.value = true;
        print("OTP sent to $email");
      } else if (result['status'] == 'not_registered') {
        isOtpSent.value = false;
        Get.snackbar("Error", "Email not registered. Please sign up first.");
      } else {
        isOtpSent.value = false;
        Get.snackbar("Error", "Failed to send OTP.");
      }
    } catch (e) {
      isOtpSent.value = false;
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> verifyOtp(String email, String otp) async {
    try {
      final result = await _apiService.verifyOtp(email, otp);
      if (result['status'] == 'success') {
        isOtpVerified.value = true;
        Get.snackbar("Success", "OTP verified. Welcome!");
        Get.toNamed('/nextPage');
      } else {
        isOtpVerified.value = false;
        Get.snackbar("Error", "Incorrect OTP. Please try again.");
      }
    } catch (e) {
      isOtpVerified.value = false;
      Get.snackbar("Error", e.toString());
    }
  }
}
