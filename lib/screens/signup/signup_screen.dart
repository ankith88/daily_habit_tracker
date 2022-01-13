import 'package:flutter/material.dart';

import '../../size_config.dart';
import './components/signup.dart';

class SignupScreen extends StatelessWidget {
  static String routeName = "/signup";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Signup(),
    );
  }
}
