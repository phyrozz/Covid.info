import 'package:covid_info/screens/about.dart';
import 'package:covid_info/screens/authenticate/register.dart';
import 'package:covid_info/screens/authenticate/sign_in.dart';
import 'package:covid_info/screens/browser.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterPage());
      case '/sign-in':
        return MaterialPageRoute(builder: (_) => SignInPage());
      case '/about':
        return MaterialPageRoute(builder: (_) => AboutPage());
      case '/browser':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => BrowserPage(
                    data: args,
                  ));
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('App Error. Please restart the app.'),
        ),
      );
    });
  }
}
