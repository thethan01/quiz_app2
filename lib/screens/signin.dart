import 'package:quiz_app2/constants.dart';
import 'package:quiz_app2/screens/forget_password.dart';
import 'package:quiz_app2/screens/get_started.dart';
import 'package:quiz_app2/screens/home.dart';
import 'package:quiz_app2/screens/signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app2/services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  static const String id = "SigIn_screen";
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  String email = '';
  String password = '';
  AuthService authService = AuthService();
  bool _isLoading = false;
  signIn() async {
    setState(() {
      _isLoading = true;
    });
    await authService
        .signInEmail(email, password)
        .then((value) {
      if (value == null) {
        setState(() {
          _isLoading = false;
        });
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Container(
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      SvgPicture.asset(
                        "assets/images/signup1.svg",
                        color: kLightColor,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 55, bottom: 35),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: IconButton(
                                color: kTextDarkColor,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                onPressed: () {
                                  Navigator.pushNamed(context, GetStarted.id);
                                },
                                icon: const Icon(Icons.keyboard_backspace),
                              ),
                            ),
                          ),
                          const Text(
                            "Welcome Back!",
                            style: TextStyle(
                                color: kTextDarkColor,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                          ctnFace(),
                          ctnGG(),
                          const Padding(
                            padding: EdgeInsets.only(top: 15, bottom: 35),
                            child: Text(
                              'OR LOG IN WITH EMAIL',
                              style: TextStyle(color: kDarkColor, fontSize: 14),
                            ),
                          ),
                          Form(key: _formKey, child: buildTextField())
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
    );
  }

  Column buildTextField() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 22, right: 15, left: 15),
          child: TextFormField(
            validator: (val) => val!.isEmpty ? "Enter Email" : null,
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
            controller: _emailController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 22, right: 15, left: 15),
          child: TextFormField(
            validator: (val) => val!.isEmpty ? "Enter Password" : null,
            onChanged: (val) {
              password = val;
            },
            controller: _passController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: kTextLightColor)),
              hintStyle: const TextStyle(color: kDarkColor),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              fillColor: kTextLightColor,
              filled: true,
            ),
          ),
        ),
        SizedBox(
          height: 60,
          width: 374,
          child: Expanded(
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(34)),
              onPressed: () {
                signIn();
              },
              child: const Text(
                'LOG IN',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              color: kColor,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20, bottom: 50),
          child: ForgotPw(),
        ),
        const TextSignUp()
      ],
    );
  }

  Padding ctnGG() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: InkWell(
        onTap: () {},
        child: SvgPicture.asset("assets/images/gg.svg"),
      ),
    );
  }

  Padding ctnFace() {
    return Padding(
      padding: const EdgeInsets.only(top: 35),
      child: InkWell(
        onTap: () {},
        child: SvgPicture.asset("assets/images/fb.svg"),
      ),
    );
  }
}

class ForgotPw extends StatelessWidget {
  const ForgotPw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: 'Forgot Password?',
            style: const TextStyle(color: kTextDarkColor, fontSize: 14),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, ForgotPassword.id);
              }));
  }
}

class TextSignUp extends StatelessWidget {
  const TextSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: 'Don\'t have account?',
          style: const TextStyle(color: kDarkColor, fontSize: 14),
          children: [
            TextSpan(
                text: ' Sign up',
                style: const TextStyle(color: kColor, fontSize: 14),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, SignUp.id);
                  })
          ]),
    );
  }
}
