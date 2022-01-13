import 'package:flutter/material.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';

import '../../../constants.dart';
import '../../landing/landing_screen.dart';

import '../../../components/default_button.dart';
import '../../../size_config.dart';

class Signup extends StatelessWidget {
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
              Image.asset(
                "assets/images/casual-life-3d-avatar-with-person-in-glasses-and-orange-shirt.png",
                height: getProportionateScreenHeight(100),
                width: getProportionateScreenWidth(100),
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
                        labelText: 'First Name',
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
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Last Name',
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
                EdgeInsets.all(20),
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
                EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
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
                EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 0),
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
                    onPressed: () {},
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
