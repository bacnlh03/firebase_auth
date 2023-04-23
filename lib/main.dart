import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:auth_feature/src/app.dart';
import 'package:auth_feature/src/dependency_injector.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(const App());
}
