import 'package:quiz_app2/constants.dart';
import 'package:quiz_app2/screens/signin.dart';
import 'package:quiz_app2/screens/signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);
  static const String id = "GetStarted_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              imageGst(),
              SizedBox(
                  height: 35,
                  width: 150,
                  child: SvgPicture.asset(
                    "assets/images/logo.svg", fit: BoxFit.cover,
                  )),
              // buttonSignup(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: SizedBox(
                  height: 65,
                  width: 350,
                  child: Expanded(
                      child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(34)),
                    onPressed: () {
                      Navigator.pushNamed(context, SignUp.id);
                    },
                    child: const Text(
                      'SIGN UP',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    color: kColor,
                  )),
                ),
              ),
              RichText(
                text: TextSpan(
                    text: 'Already have an account?',
                    style: const TextStyle(color: kDarkColor, fontSize: 14),
                    children: [
                      TextSpan(
                          text: 'Sign in',
                          style: const TextStyle(color: kColor, fontSize: 14),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, SignIn.id);
                            })
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  Stack imageGst() {
    return Stack(
      children: [
        SvgPicture.asset(
          "assets/images/gst1.svg",
          color: const Color(0xffF9F0E3),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 145),
            child: Center(child: SvgPicture.asset("assets/images/gst2.svg")))
      ],
    );
  }

  RichText textSignIn() {
    return RichText(
      text: TextSpan(
          text: 'Already have an account?',
          style: const TextStyle(color: kDarkColor, fontSize: 14),
          children: [
            TextSpan(
                text: 'Sign in',
                style: const TextStyle(color: kColor, fontSize: 14),
                recognizer: TapGestureRecognizer()..onTap = () {})
          ]),
    );
  }

  Padding buttonSignup() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: SizedBox(
        height: 65,
        width: 350,
        child: Expanded(
            child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(34)),
          onPressed: () {},
          child: const Text(
            'SIGN UP',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          color: kColor,
        )),
      ),
    );
  }
}
