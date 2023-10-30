import 'package:get/get.dart';
import 'package:sign_up_with_getx/app/services/local_storage.dart';
import 'package:sign_up_with_getx/data/repositories/auth_repository.dart';

class DependencyCreator {
  static init() async{
    Get.lazyPut(() => AuthenticationRepositoryIml());
    await Get.putAsync(() => LocalStorageService().init());
  }
}
