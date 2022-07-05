import 'package:quiz_app2/constants.dart';
import 'package:quiz_app2/screens/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);
  static const String id = "forgot_screen";
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SvgPicture.asset(
                  "assets/images/gst1.svg",
                  color: kTextLightColor,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10, left: 80, right: 80),
                  child: SizedBox(
                      height: 500,
                      child: SvgPicture.asset(
                        "assets/images/forgot.svg",
                        height: 200,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 55, bottom: 35),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      color: kTextDarkColor,
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      onPressed: () {
                        Navigator.pushNamed(context, SignIn.id);
                      },
                      icon: const Icon(Icons.keyboard_backspace),
                    ),
                  ),
                ),
              ],
            ),
            const Text(
              'Forgot Password?',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Enter Email Address ',
                style: TextStyle(fontSize: 16, color: kDarkColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: kTextLightColor)),
                  hintText: 'Email address',
                  hintStyle: const TextStyle(color: kDarkColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  fillColor: kTextLightColor,
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                height: 65,
                width: 350,
                child: Expanded(
                    child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(34)),
                  onPressed: () {
                    Navigator.pushNamed(context, SignIn.id);
                  },
                  child: const Text(
                    'SEND',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  color: kColor,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
