import 'package:sign_up_with_getx/domain/entities/user.dart';
import 'package:sign_up_with_getx/domain/repositories/auth_repository.dart';

class AuthenticationRepositoryIml extends AuthenticationRepository {
  @override
  Future<User> signUp(String email, String password) async {
    //Fake sign up action
    await Future.delayed(const Duration(seconds: 1));
    return User(
      email: email,
      password: password,
    );
  }
}
