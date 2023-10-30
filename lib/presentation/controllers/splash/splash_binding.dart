import 'package:get/get.dart';
import 'package:sign_up_with_getx/presentation/controllers/splash/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
  }
}
