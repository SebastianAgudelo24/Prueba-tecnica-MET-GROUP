import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/di/dependency_injector.dart';
import 'firebase_options.dart';
import 'routes/routes.dart';
part 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await DependencyInjector().setup();

  runApp(const ProviderScope(child: MyApp()));
}
