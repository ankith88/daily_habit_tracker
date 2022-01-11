import 'package:flutter/material.dart';

import './components/landing.dart';
import '../../size_config.dart';

class LandingScreen extends StatelessWidget {
  static String routeName = "/landing";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Landing(),
    );
  }
}
