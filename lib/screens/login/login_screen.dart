import 'package:flutter/material.dart';

import '../../size_config.dart';
import './components/login.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/login";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Login(),
    );
  }
}
