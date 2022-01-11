import 'package:flutter/material.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';

import '../../../constants.dart';
import '../../landing/landing_screen.dart';

import '../../../components/default_button.dart';
import '../../../size_config.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

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
              Text('Daily Habbit Tracker',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(36),
                    color: kCardBackgroundColor,
                    fontWeight: FontWeight.bold,
                  )),
              Spacer(
                flex: 2,
              ),
              Container(
                child: Image.asset(
                  "assets/images/casual-life-3d-graph.png",
                  height: getProportionateScreenHeight(265),
                  width: getProportionateScreenWidth(235),
                ),
              ),
              Spacer(
                flex: 2,
              ),
              DefaultButton(
                text: "Continue",
                press: () {
                  Navigator.pushNamed(context, LandingScreen.routeName);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
