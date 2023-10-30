import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:sign_up_with_getx/app/config/router/RouteNames.dart';
import 'package:sign_up_with_getx/app/services/local_storage.dart';
import 'package:sign_up_with_getx/domain/entities/user.dart';
import 'package:sign_up_with_getx/domain/usecases/signup_use_case.dart';

class VerificationController extends GetxController {
  VerificationController(this._loginUseCase);

  final SignUpUseCase _loginUseCase;
  final store = Get.find<LocalStorageService>();
  var isLoggedIn = false.obs;
  var hasError = false.obs;
  var canSubmit = false.obs;
  var verifyCode = ''.obs;
  var enteredCode = ''.obs;
  var remainingSeconds = 120.obs;

  User? get user => store.user;

  @override
  void onInit() async {
    super.onInit();
    createVerifyCode();
  }

  void startTimer() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (remainingSeconds.value > 0) {
          remainingSeconds.value--;
        } else {
          timer.cancel();
          canSubmit.value = false;
        }
      },
    );
  }

  submitVerification(String email, String password) async {
    try {
      if (enteredCode == verifyCode) {
        print('Entered');
        final user = await _loginUseCase.execute((email, password));
        store.user = user;

        Get.offNamed(
          RouteNames.home,
        );
      } else {
        hasError.value = true;
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }

  void createVerifyCode() {
    verifyCode.value = '';
    canSubmit.value = true;
    hasError.value = false;

    final random = Random();
    String code = '';
    for (int i = 0; i < 5; i++) {
      code = code + random.nextInt(9).toString();
    }

    verifyCode.value = code;
    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Get.showSnackbar(
          GetSnackBar(
            title: 'verification'.tr,
            backgroundColor: Colors.indigo,
            message: 'Verification code is: ${verifyCode.value}',
          ),
        );
      },
    );

    startTimer();
  }
}
