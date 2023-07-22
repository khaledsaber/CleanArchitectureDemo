import 'package:clean_architecture_demo/presentation/forgot_password/forgot_password_view.dart';
import 'package:clean_architecture_demo/presentation/login/login_view.dart';
import 'package:clean_architecture_demo/presentation/main/main_view.dart';
import 'package:clean_architecture_demo/presentation/onboarding/onboarding_view.dart';
import 'package:clean_architecture_demo/presentation/register/register_view.dart';
import 'package:clean_architecture_demo/presentation/splash/splash_view.dart';
import 'package:clean_architecture_demo/presentation/store_details/store_details_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
  static const String onBoardingRoute = "/onBoarding";
}

class RouteGenerator {

  static Route<dynamic>? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());

      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());

      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());

      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());

      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());

      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const StoreDetailsView());

      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());


      default:
        unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text("No Routes Found"),
        ),
        body: const Center(
          child: Text('No Routes Found'),
        ),
      ),
    );
  }
}
