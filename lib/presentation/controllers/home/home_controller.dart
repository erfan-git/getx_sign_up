import 'package:get/get.dart';
import 'package:sign_up_with_getx/app/config/router/RouteNames.dart';
import 'package:sign_up_with_getx/app/services/local_storage.dart';
import 'package:sign_up_with_getx/domain/entities/user.dart';

class HomeController extends GetxController {
  final store = Get.find<LocalStorageService>();

  var currentIndex = 0.obs;

  User get user => store.user!;

  logout() {
    store.user = null;
    Get.offNamed(
      RouteNames.splash,
    );
  }
}
