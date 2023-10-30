import 'package:get/get.dart';
import 'package:sign_up_with_getx/app/config/router/RouteNames.dart';
import 'package:sign_up_with_getx/app/services/local_storage.dart';

class SplashController extends GetxController {
  final store = Get.find<LocalStorageService>();

  @override
  void onInit() async {
    super.onInit();

    await 2.delay();

    Get.offNamed(
      store.user != null ? RouteNames.home : RouteNames.signUp,
    );
  }
}
