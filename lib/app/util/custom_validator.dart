
abstract class StringValidator {
  bool isValid(String? value, {String? secondValue});
}

class NonEmptyStringValidator implements StringValidator {
  @override
  bool isValid(String? value, {String? secondValue}) {
    if (value == null) return false;
    return value.isNotEmpty;
  }
}

class CharacterLengthValidator implements StringValidator {
  CharacterLengthValidator(this._charLength);

  final int _charLength;

  @override
  bool isValid(String? value, {String? secondValue}) {
    if (value == null) return false;
    return value.length > _charLength;
  }
}

class SameStringsValidator implements StringValidator {
  @override
  bool isValid(String? value, {String? secondValue}) {
    if (value == null || secondValue == null) return false;
    return value == secondValue;
  }
}

class ValidEmailValidator implements StringValidator {
  @override
  bool isValid(String? value, {String? secondValue}) {
    if (value == null) return false;
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value);
  }
}

mixin CustomValidators {
  static const minPasswordLength = 6;

  final StringValidator emailValidator = ValidEmailValidator();
  final StringValidator passwordValidator =
      CharacterLengthValidator(minPasswordLength - 1);
  final StringValidator confirmPasswordValidator = SameStringsValidator();
  final invalidEmailErrorText = 'The email field is not a valid e-mail address';
  final invalidPasswordErrorText =
      'The minimum length of password field is $minPasswordLength';
  final invalidConfirmPasswordErrorText =
      "Confirm password field , doesn't match The password field";
}
