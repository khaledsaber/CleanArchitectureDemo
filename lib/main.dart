import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/di.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await intiAppModule();
  runApp(MyApp());
}
