import 'package:convre/layout_view.dart';
import 'package:convre/view/auths/forgot_password_view.dart';
import 'package:convre/view/auths/login_view.dart';
import 'package:convre/view/auths/register_view.dart';
import 'package:convre/view/hompage/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String LayoutScreen = '/layout-view';
const String LoginScreen = '/login-view';
const String HomePageScreen = '/homePage-view';
const String RegisterScreen = '/register-view';
const String ForgotPasswordScreen = '/forgot-password';



Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
         case LayoutScreen:
      return _getPageRoute(
        routeName: settings.name,
        view: LayoutView(),
        args: settings.arguments,
      );
     case HomePageScreen:
      return _getPageRoute(
        routeName: settings.name,
        view: HomeView(),
        args: settings.arguments,
      );
    case LoginScreen:
      return _getPageRoute(
        routeName: settings.name,
        view: LoginView(),
        args: settings.arguments,
      );
          case RegisterScreen:
      return _getPageRoute(
        routeName: settings.name,
        view: RegisterView(),
        args: settings.arguments,
      );
    case ForgotPasswordScreen:
      return _getPageRoute(
        routeName: settings.name,
        view: ForgotPasswordView(),
        args: settings.arguments,
      );
    default:
      return CupertinoPageRoute<dynamic>(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}

PageRoute<dynamic> _getPageRoute({String routeName, Widget view, Object args}) {
  return CupertinoPageRoute<dynamic>(
      settings: RouteSettings(name: routeName, arguments: args),
      builder: (_) => view);
}

void routeTo(BuildContext context, Widget view, {bool dialog = false}) {
  Navigator.push<void>(
      context,
      CupertinoPageRoute<dynamic>(
          builder: (BuildContext context) => view, fullscreenDialog: dialog));
}

void routeToReplace(BuildContext context, Widget view) {
  Navigator.pushAndRemoveUntil<void>(
      context,
      CupertinoPageRoute<dynamic>(builder: (BuildContext context) => view),
      (Route<void> route) => false);
}
