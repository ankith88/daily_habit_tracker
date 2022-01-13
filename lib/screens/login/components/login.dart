import 'package:daily_habbit_tracker/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';

import '../../../constants.dart';
import '../../landing/landing_screen.dart';

import '../../../components/default_button.dart';
import '../../../size_config.dart';

class Login extends StatelessWidget {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Spacer(),
              Image.asset(
                "assets/images/casual-life-3d-avatar-with-person-in-glasses-and-orange-shirt.png",
                height: getProportionateScreenHeight(250),
                width: getProportionateScreenWidth(250),
              ),
              Spacer(
                flex: 1,
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: kAmountTextColor),
                      ),
                      style: TextStyle(
                        color: kAmountTextColor,
                      ),
                      controller: emailController,
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: kAmountTextColor),
                      ),
                      style: TextStyle(
                        color: kAmountTextColor,
                      ),
                      controller: emailController,
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 15),
                child: DefaultButton(
                  text: "Login",
                  press: () {
                    Navigator.pushNamed(context, LandingScreen.routeName);
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 0, bottom: 10),
                child: Text(
                    "Don't have an account?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getProportionateScreenWidth(14),
                  ),
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 0),
                child: SizedBox(
                  width: double.infinity,
                  height: getProportionateScreenHeight(56),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      primary: Colors.white,
                      elevation: 6,
                      animationDuration: Duration(seconds: 5),
                      backgroundColor: kSecondaryTextColor,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, SignupScreen.routeName);
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(20),
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
