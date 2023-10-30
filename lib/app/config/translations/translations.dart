import 'package:get/get.dart';

class AppTranslations extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    //ENGLISH LANGUAGE
    'en_US':{
      'email':'Email',
      'password':'password',
      'confirm_password':'Confirm Password',
      'sign_up':'Sign Up',
      'verify':'Verify',
      'enterVerificationCode':'Enter verification code:',
      'remaining_time':'Remaining time:',
      'resend_code':'Resend verification code?',
      'verify_error':'Code is incorrect',
    },

    //FARSI LANGUAGE
    'fa_IR':{
      'email':'ایمیل',
      'password':'رمزعبور',
      'confirm_password':'تکرار رمز عبور',
      'sign_up':'عضویت',
      'verify':'صحت سنجی',
      'enterVerificationCode':'کد صحت سنجی را وارد کنید:',
      'remaining_time':'زمان باقی مانده:',
      'resend_code':'ارسال دوباره کد صحت سنجی؟',
      'verify_error':'کد وارد شده اشتباه است',
    },
  };

}