import 'package:flutter/material.dart';
import 'package:tut_app_flutter/app/di.dart';

import 'app/app.dart';

void main() async {
  // init dependency module in app
  WidgetsFlutterBinding
      .ensureInitialized(); // ensure to init all instance for legacy lib which can be null
  await initAppModule();
  runApp(MyApp());
}
