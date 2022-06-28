import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:innovative/app/app.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

