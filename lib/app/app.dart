import 'package:flutter/material.dart';
import 'package:innovative/utils/routes_manager.dart';
import 'package:sizer/sizer.dart';

class MyApp extends StatefulWidget {
  //const MyApp({Key? key}) : super(key: key); //default constractor

//Private named constractor
  MyApp._internal();

//Single Instance--Singleton
  static final MyApp instance = MyApp._internal();

//factory for the class instance
  factory MyApp() => instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Bano Live',
            theme: 
            //getApplicationTheme(),
            ThemeData(
            //  fontFamily: FontConstants.fontFamily,
              primarySwatch: myappColor,
            ),
            //home: Container(),
            initialRoute: Routes.splashRoute,
            onGenerateRoute: RouteGenerator.getRoute,
          );
        });
  }

  MaterialColor myappColor = const MaterialColor(
    0xFF27B0FF,
    <int, Color>{
      50: Color(0xFF27B0FF), //10%
      100: Color(0xFF27B0FF), //20%
      200: Color(0xFF27B0FF), //30%
      300: Color(0xFF27B0FF), //40%
      400: Color(0xFF27B0FF), //50%
      500: Color(0xFF27B0FF), //60%
      600: Color(0xFF27B0FF), //70%
      700: Color(0xFF27B0FF), //80%
      800: Color(0xFF27B0FF), //90%
      900: Color(0xFF27B0FF), //100%
    },
  );
}
