import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_up_with_getx/app/config/router/RouteNames.dart';
import 'package:sign_up_with_getx/app/config/router/router.dart';
import 'package:sign_up_with_getx/app/config/translations/translations.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SignUpGetX',
      debugShowCheckedModeBanner: false,
      translations: AppTranslations(),
      locale: const Locale('en', 'US'),
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 200),
      getPages: AppRouter.routes,
      initialRoute: RouteNames.splash,
      builder: (context, widget) => widget!,
    );
  }
}
