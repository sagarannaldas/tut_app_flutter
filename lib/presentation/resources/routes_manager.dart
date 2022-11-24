import 'package:flutter/material.dart';
import 'package:tut_app_flutter/presentation/forgetpassword/forget_password.dart';
import 'package:tut_app_flutter/presentation/login/login.dart';
import 'package:tut_app_flutter/presentation/main/main.dart';
import 'package:tut_app_flutter/presentation/onboarding/on_boarding.dart';
import 'package:tut_app_flutter/presentation/register/register.dart';
import 'package:tut_app_flutter/presentation/resources/strings_manager.dart';
import 'package:tut_app_flutter/presentation/splash/splash.dart';
import 'package:tut_app_flutter/presentation/storedetails/store_details.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/on_boarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgetPasswordRoute = "/forget_password";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const StoreDetailsView());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
