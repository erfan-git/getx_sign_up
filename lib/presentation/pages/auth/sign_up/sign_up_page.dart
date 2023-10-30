import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_up_with_getx/app/config/router/RouteNames.dart';
import 'package:sign_up_with_getx/app/util/assets.dart';
import 'package:sign_up_with_getx/app/util/custom_validator.dart';
import 'package:sign_up_with_getx/presentation/controllers/auth/sign_up/sign_up_controller.dart';
import 'package:sign_up_with_getx/presentation/widgets/custom_button.dart';
import 'package:sign_up_with_getx/presentation/widgets/custom_textfield.dart';

class SignUpPage extends GetView<SignUpController> with CustomValidators {
  SignUpPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /// app icon
                SizedBox(height: height * 0.05),
                Assets.images.logo.svg(
                  width: 160,
                  color: Colors.white,
                ),

                /// email field
                const SizedBox(height: 16),
                CustomTextField(
                  hintText: 'email'.tr,
                  controller: controller.emailController,
                  validator: (email) {
                    if (!emailValidator.isValid(email!.trim())) {
                      return invalidEmailErrorText;
                    }
                    return null;
                  },
                  prefixIcon: Assets.icons.person.svg(
                      // width: 16,
                      ),
                ),

                /// password field
                const SizedBox(height: 16),
                CustomTextField(
                  hintText: 'password'.tr,
                  controller: controller.passwordController,
                  obscureText: true,
                  prefixIcon: Assets.icons.lock.svg(),
                  validator: (name) {
                    if (!passwordValidator.isValid(name!.trim())) {
                      return invalidPasswordErrorText;
                    }
                    return null;
                  },
                ),

                /// password field
                const SizedBox(height: 16),
                CustomTextField(
                  hintText: 'confirm_password'.tr,
                  controller: controller.confirmPasswordController,
                  prefixIcon: Assets.icons.lock.svg(),
                  obscureText: true,
                  validator: (name) {
                    if (!confirmPasswordValidator.isValid(
                      name!.trim(),
                      secondValue: controller.confirmPasswordController.text,
                    )) {
                      return invalidConfirmPasswordErrorText;
                    }
                    return null;
                  },
                ),

                /// signup button
                const SizedBox(height: 54),
                CustomButton(
                  btnText: 'sign_up'.tr,
                  onTap: () {
                    if (_formKey.currentState?.validate() ?? true) {
                      Get.toNamed(
                        RouteNames.verification,
                        arguments: {
                          'email': controller.emailController.text,
                          'password': controller.passwordController.text,
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
