import 'package:flutter/material.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';

import '../../../constants.dart';
import '../../landing/landing_screen.dart';
import '../../login/login_screen.dart';

import '../../../components/default_button.dart';
import '../../../size_config.dart';

class Splash extends StatelessWidget {

  var quotes = [
    {
      "quote": "Discipline is choosing between what you want now and what you want most.",
      "author": "- Abraham Lincoln"
    },
    {
      'quote': 'Success is the sum of small efforts repeated day in and day out.',
      'author': '- Robert Collier'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Text('Daily Habit Tracker',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(36),
                    color: kCardBackgroundColor,
                    fontWeight: FontWeight.bold,
                  )
              ),
              Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                        left: 0, bottom: 10, top: 10, right: 0),
                    child: Text(
                      quotes[0]['quote'] as String,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(16),
                          color: Colors.white
                      ),
                    ),
                  ),
                  Text(
                    quotes[0]['author'] as String,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(16),
                        color: Colors.white
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                    left: 25, bottom: 50, top: 50, right: 0),
                child: Image.asset(
                  "assets/images/casual-life-3d-reading.png",
                  height: getProportionateScreenHeight(350),
                  width: getProportionateScreenWidth(350),
                ),
              ),
              DefaultButton(
                text: "Login",
                press: () {
                  Navigator.pushNamed(context, LoginScreen.routeName);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
