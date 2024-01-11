import 'package:tezda_ecom/presentation/auth/login_screen/view.dart';
import 'package:tezda_ecom/presentation/main_screen/view.dart';

mixin RoutePath {
  static const String loginScreen = "/LOGIN_SCREEN";
  static const String signupScreen = "/SIGNUP_SCREEN";
  static const String mainScreen = "/MAIN_SCREEN";
}

abstract class GetNamedRoutes {
  static getRoutes() {
    return {
      RoutePath.loginScreen: (context) => const LoginScreen(),
      RoutePath.mainScreen: (context) => const MainScreen()
    };
  }
}
