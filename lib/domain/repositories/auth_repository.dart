import 'package:sign_up_with_getx/domain/entities/user.dart';

abstract class AuthenticationRepository {
  Future<User> signUp(String email, String password);
}
