import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:idly_factory/widgets/common_widgets/textform_widget.dart';
import 'package:idly_factory/widgets/common_widgets/ev_large_button.dart';
import '../../../constants/strings.dart';
import '../../../controllers/signup_login_controllers/signin_controllers.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isSignIn = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController verificationCodeController = TextEditingController();
  final SignInController _signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15.w),
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isSignIn
                  ? Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text("Email Address".tr),
                  ),
                  SizedBox(height: 15.h),
                  CustomTextFormField(
                    hintText: 'Email Address'.tr,
                    prefixIcon: Icons.email_outlined,
                    controller: emailController,
                    validator: (v) => _validateEmail(v),
                  ),
                  SizedBox(height: 20.h),
                  Center(
                    child: EvLargeButton(
                      text: AppStrings.signIn.tr,
                      onPressed: () {

                      },
                      padding: EdgeInsets.symmetric(horizontal: 140.w, vertical: 10.h),
                    ),
                  ),
                ],
              )
                  : Column(
                children: [
                  Text("Verification Code".tr),
                  SizedBox(height: 15.h),
                  CustomTextFormField(
                    hintText: 'Enter Verification Code'.tr,
                    prefixIcon: Icons.lock_outline,
                    controller: verificationCodeController,
                    validator: (v) => _validateVerificationCode(v),
                  ),
                  SizedBox(height: 20.h),
                  Center(
                    child: EvLargeButton(
                      text: "Verify".tr,
                      onPressed: () {
                        _signInController.verifyOtp(
                          emailController.text,
                          verificationCodeController.text,
                        );
                      },
                      padding: EdgeInsets.symmetric(horizontal: 140.w, vertical: 10.h),
                    ),
                  ),
                ],
              ),
              isSignIn
                  ? Center(child: CircularProgressIndicator())
                  : SizedBox.shrink(),
            ],
          );
        }),
      ),
    );
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validateVerificationCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the verification code';
    }
    return null;
  }
}
