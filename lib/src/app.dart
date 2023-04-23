import 'package:auth_feature/src/presentation/views/login_page.dart';
import 'package:auth_feature/src/presentation/views/register_page.dart';
import 'package:auth_feature/src/utils/constants/constants.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: Strings.appTitle,
      home: const RegisterPage(),
      // home: const LoginPage(),
    );
  }
}
