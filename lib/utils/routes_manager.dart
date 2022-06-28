
import 'package:flutter/material.dart';
import 'package:innovative/view/AppointmentsSchedule/appointments_schedule_screen.dart';
import 'package:innovative/view/signup/signup_screen.dart';
import 'package:innovative/view/splash/splash_screen.dart';

class Routes {
  static const String splashRoute = "/";
  static const String appointmentsScheduleRoute = "/appointmentsschedule";
  static const String signUpRoute = "/signup";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) =>const SignUpView());
        case Routes.appointmentsScheduleRoute:
        return MaterialPageRoute(builder: (_) =>const AppointmentsScheduleView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(title: Text("No Route Found")),
              body: Center(child: Text("No Route Found")),
            ));
  }
}
