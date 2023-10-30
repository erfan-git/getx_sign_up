import 'package:sign_up_with_getx/app/core/usecases/pram_usecase.dart';
import 'package:sign_up_with_getx/domain/entities/user.dart';
import 'package:sign_up_with_getx/domain/repositories/auth_repository.dart';

class SignUpUseCase
    extends ParamUseCase<User, (String email, String password)> {
  final AuthenticationRepository _repo;

  SignUpUseCase(this._repo);

  @override
  Future<User> execute((String email, String password) params) {
    return _repo.signUp(params.$1, params.$2);
  }
}
