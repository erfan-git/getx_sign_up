import 'package:get/get.dart';
import 'package:sign_up_with_getx/data/repositories/auth_repository.dart';
import 'package:sign_up_with_getx/domain/usecases/signup_use_case.dart';
import 'package:sign_up_with_getx/presentation/controllers/auth/verification/verification_controller.dart';

class VerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpUseCase(Get.find<AuthenticationRepositoryIml>()));
    Get.put(VerificationController(Get.find()), permanent: true);
  }
}
