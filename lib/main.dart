import 'package:flutter/material.dart';
import 'package:sign_up_with_getx/app/util/dependency.dart';
import 'package:sign_up_with_getx/presentation/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyCreator.init();
  runApp(const App());
}
