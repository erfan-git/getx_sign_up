import 'package:get/get.dart';
import 'package:sign_up_with_getx/app/config/router/RouteNames.dart';
import 'package:sign_up_with_getx/presentation/controllers/auth/sign_up/sign_up_binding.dart';
import 'package:sign_up_with_getx/presentation/controllers/auth/verification/verification_binding.dart';
import 'package:sign_up_with_getx/presentation/controllers/home/home_binding.dart';
import 'package:sign_up_with_getx/presentation/controllers/splash/splash_binding.dart';
import 'package:sign_up_with_getx/presentation/pages/auth/sign_up/sign_up_page.dart';
import 'package:sign_up_with_getx/presentation/pages/auth/verification/verification_page.dart';
import 'package:sign_up_with_getx/presentation/pages/home/home.dart';
import 'package:sign_up_with_getx/presentation/pages/splash/splash.dart';

class AppRouter {
  AppRouter._();

  static List<GetPage> routes = [
    GetPage(
      name: RouteNames.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: RouteNames.signUp,
      page: () => SignUpPage(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: RouteNames.verification,
      page: () => VerificationPage(),
      binding: VerificationBinding(),
    ),
    GetPage(
      name: RouteNames.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
