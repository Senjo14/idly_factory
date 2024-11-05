import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idly_factory/routes/app_routes/app_routes.dart';
import 'package:idly_factory/services/auth_service/signup_apiservice.dart';

class SignUpController extends GetxController {
  final formKey = GlobalKey<FormState>();

  RxBool isOptionalInfoVisible = true.obs;
  RxBool receiveSpecialOffers = false.obs;
  RxBool agreePrivacyPolicy = false.obs;
  RxBool isLoading = false.obs;

  RxString dob = ''.obs;

  String? validateName(String? value) {
    print("Validating Name: $value");
    if (value == null || value.isEmpty) {
      return "Name is required";
    }
    if (value.length < 6) {
      return "Name must be at least 6 characters long";
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    final emailRegex =
    RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return "Please enter a valid email address";
    }
    return null;
  }

  bool isFormValid() {
    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState?.save();
      return true;
    }
    return false;
  }

  Future<void> signUp(
      String name, String email, bool receiveSpecialOffers, String? dob) async {
    if (!agreePrivacyPolicy.value) {
      Get.snackbar("Privacy Policy", "You must agree to the Privacy Policy");
      return;
    }

    if (!isFormValid()) {
      Get.snackbar("Form Invalid", "Please correct the errors and try again.");
      return;
    }

    isLoading.value = true;

    final response = await ApiService.signup(
      name: name,
      email: email,
      receiveSpecialOffers: receiveSpecialOffers,
      dob: dob,
    );

    isLoading.value = false;

    if (response.success) {
      Get.offAllNamed('/scan');
    } else {
      Get.snackbar(
          "Sign Up Failed", response.message ?? "Something went wrong.");
    }
  }
}