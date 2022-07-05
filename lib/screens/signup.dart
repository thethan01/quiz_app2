import 'package:quiz_app2/constants.dart';
import 'package:quiz_app2/screens/quiz_screen.dart';
import 'package:quiz_app2/screens/get_started.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app2/screens/home.dart';
import 'package:quiz_app2/services/auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  static const String id = "SignUp_screen";
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey();
  String email = '', password = '', username = '';
  AuthService authService = AuthService();
  bool _isLoading = false;
  signUp() async {
    setState(() {
      _isLoading = true;
    });
    authService
        .signUnEmail(
            _emailController.text.trim(), _passwordController.text.trim())
        .then((value) {
      if (value != null) {
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
                            "Create your account",
                            style: TextStyle(
                                color: kTextDarkColor,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                          ctnFace(),
                          ctnGG(),
                          const Padding(
                            padding: EdgeInsets.only(top: 20, bottom: 45),
                            child: Text(
                              'OR SIGN UP WITH EMAIL',
                              style: TextStyle(color: kDarkColor, fontSize: 14),
                            ),
                          ),
                          Form(key: _formKey, child: textField())
                        ],
                      ) //Chuyen huong dang nhap
                    ],
                  )
                ],
              ),
            ),
    );
  }

  Padding ctnGG() {
    // nut dang nhap bang GG
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: InkWell(
        onTap: () {},
        child: SvgPicture.asset("assets/images/gg.svg"),
      ),
    );
  } // nut dang nhap bang GG

  Padding ctnFace() {
    return Padding(
      padding: const EdgeInsets.only(top: 35),
      child: InkWell(
        onTap: () {},
        child: SvgPicture.asset("assets/images/fb.svg"),
      ),
    );
  } // nut dang nhap bang FB

  Column textField() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 22, right: 15, left: 15),
          child: TextFormField(
            validator: (val) => val!.isEmpty ? "Enter Username" : null,
            onChanged: (val) {
              username = val;
            },
            controller: _usernameController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              hintText: 'User name',
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
        Padding(
          padding: const EdgeInsets.only(bottom: 22, right: 15, left: 15),
          child: TextFormField(
            validator: (val) => val!.isEmpty ? "Enter Email" : null,
            onChanged: (val) {
              email = val;
            },
            controller: _emailController,
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
          padding: const EdgeInsets.only(bottom: 22, right: 15, left: 15),
          child: TextFormField(
            validator: (val) => val!.isEmpty ? "Enter Password" : null,
            onChanged: (val) {
              password = val;
            },
            controller: _passwordController,
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
                signUp();
              },
              child: const Text(
                'GET STARTED',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              color: kColor,
            ),
          ),
        )
      ],
    );
  } // Textfield
}
