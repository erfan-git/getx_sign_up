import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sign_up_with_getx/presentation/controllers/auth/verification/verification_controller.dart';
import 'package:sign_up_with_getx/presentation/widgets/custom_button.dart';

class VerificationPage extends GetView<VerificationController> {
  VerificationPage({super.key});

  final Map<String, dynamic> userData = Get.arguments;

  void onTabVerifyButton() {
    if (controller.canSubmit.value) {
      controller.submitVerification(
        userData['email'],
        userData['password'],
      );
    } else {
      Get.showSnackbar(
        GetSnackBar(
          title: 'Error'.tr,
          backgroundColor: Colors.red,
          message: 'Time is up',
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final phoneNumberTextField = Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: PinCodeTextField(
        animationDuration: const Duration(milliseconds: 150),
        errorAnimationDuration: 500,
        blinkDuration: const Duration(milliseconds: 500),
        appContext: context,
        enabled: true,
        length: 5,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        useHapticFeedback: true,
        showCursor: true,
        hapticFeedbackTypes: HapticFeedbackTypes.vibrate,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        keyboardType: TextInputType.number,
        pinTheme: PinTheme.defaults(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(12),
          borderWidth: 1,
          fieldWidth: 60,
          fieldHeight: 55,
          errorBorderColor: Colors.red,
          activeColor: controller.hasError.value ? Colors.red : Colors.black,
          selectedColor: Colors.blue,
          inactiveColor: const Color(0xff034193),
          activeFillColor: const Color(0xff034193),
          inactiveFillColor: const Color(0xff034193),
          selectedFillColor: const Color(0xff034193),
        ),
        onChanged: (value) {
          controller.enteredCode.value = value;
          if (value.length == 5) {
            onTabVerifyButton();
          }
        },
      ),
    );

    return Scaffold(
      backgroundColor: Colors.cyan,
      body: SafeArea(
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'enterVerificationCode'.tr,
                  style: GoogleFonts.poppins(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              const SizedBox(height: 32),
              phoneNumberTextField,
              if (controller.hasError.value)
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    'verify_error'.tr,
                    style: GoogleFonts.poppins(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.red,
                    ),
                  ),
                ),

              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  '${'remaining_time'.tr} --> ${controller.remainingSeconds.value ~/ 60}:${controller.remainingSeconds.value % 60}',
                  style: GoogleFonts.poppins(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const SizedBox(height: 16),
              if (controller.remainingSeconds.value == 0)
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'resend_code'.tr,
                            style: GoogleFonts.poppins(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff034193),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                controller.createVerifyCode();
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              /// verify button
              const Spacer(),

              CustomButton(
                btnText: 'verify'.tr,
                onTap: onTabVerifyButton,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
