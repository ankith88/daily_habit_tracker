import 'package:flutter/widgets.dart';

import './screens/splash/splash_screen.dart';
import './screens/landing/landing_screen.dart';
import './screens/login/login_screen.dart';
import './screens/signup/signup_screen.dart';


// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  LandingScreen.routeName: (context) => LandingScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  SignupScreen.routeName: (context) => SignupScreen(),
};
