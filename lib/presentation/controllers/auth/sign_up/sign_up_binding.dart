import 'package:get/get.dart';
import 'package:sign_up_with_getx/presentation/controllers/auth/sign_up/sign_up_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignUpController(), permanent: true);
  }
}
