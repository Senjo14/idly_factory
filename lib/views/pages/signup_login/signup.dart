import 'package:idly_factory/controllers/signup_login_controllers/signup_controller.dart';
import 'package:idly_factory/views/widgets/home_widgets/optional_visible.dart';
import 'package:idly_factory/widgets/common_widgets/ev_large_button.dart';
import 'package:idly_factory/widgets/common_widgets/textform_widget.dart';

import '../../../core/export.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  final signUpController = Get.put(SignUpController());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Form(
          key: signUpController.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10.h),
              CustomTextFormField(
                controller: nameController,
                validator: signUpController.validateName,
                hintText: 'Name',
                prefixIcon: Icons.person,
              ),
              SizedBox(height: 10.h),
              SizedBox(height: 10.h),
              CustomTextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: signUpController.validateEmail,
                hintText: 'Email Address',
                prefixIcon: Icons.email_outlined,
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      signUpController.isOptionalInfoVisible.value =
                          !signUpController.isOptionalInfoVisible.value;
                    },
                    child: Text("Optional Information"),
                  ),
                  Obx(() => Icon(signUpController.isOptionalInfoVisible.value
                      ? Icons.arrow_drop_down
                      : Icons.arrow_drop_up)),
                ],
              ),
              Obx(() => OptionalInformation(isOptionalInfoVisible: signUpController.isOptionalInfoVisible.value)),
              Obx(() => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: signUpController.receiveSpecialOffers.value,
                        onChanged: (bool? value) {
                          signUpController.receiveSpecialOffers.value =
                              value ?? false;
                        },
                      ),
                      SizedBox(width: 10.w),
                      const Expanded(
                        child: Text(
                          " I want to receive Special Offers and other information via email",
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ],
                  )),
              Obx(() => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: signUpController.agreePrivacyPolicy.value,
                        onChanged: (bool? value) {
                          signUpController.agreePrivacyPolicy.value =
                              value ?? false;
                        },
                      ),
                      SizedBox(width: 10.w),
                      const Expanded(
                        child: Text(
                          "I agree to the following : Privacy Policy,Idly Rewards Terms and Conditions and Terms of Service.",
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ],
                  )),
              if (!signUpController.agreePrivacyPolicy.value)
                Text(
                  "You must agree to the Privacy Policy",
                  style: TextStyle(color: Colors.red),
                ),
              SizedBox(height: 20.h),
              Obx(() {
                return signUpController.isLoading.value
                    ? CircularProgressIndicator()
                    : Center(
                        child: EvLargeButton(
                          padding: EdgeInsets.symmetric(horizontal: 120.w,vertical: 12.h),
                          onPressed: () {
                            if (signUpController.isFormValid()) {
                              signUpController.signUp(
                                nameController.text,
                                emailController.text,
                                signUpController.receiveSpecialOffers.value,
                                signUpController.dob.value.isNotEmpty
                                    ? signUpController.dob.value
                                    : null,
                              );
                              FocusScope.of(context).unfocus();
                              Get.to(() => HomePage());
                            } else {
                              Get.snackbar(
                                "Form Invalid",
                                "Please correct the errors and try again.",
                                backgroundColor: Colors.grey,
                                colorText: Colors.red,
                                duration: Duration(seconds: 2),
                              );
                            }
                          },
                          text: 'Submit'
                        ),
                      );
              }),
              SizedBox(height: 20.w),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.language),
                    SizedBox(width: 20.w),
                    Text("Language"),
                  ],
                ),
              ),
              SizedBox(height: 150.h),
            ],
          ),
        ),
      ),
    );
  }
}
