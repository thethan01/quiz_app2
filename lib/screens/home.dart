import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_app2/constants.dart';
import 'package:quiz_app2/screens/get_started.dart';
import 'package:quiz_app2/screens/quiz_screen.dart';
import 'package:quiz_app2/services/auth.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: SizedBox(
            height: 35,
            width: 150,
            child: SvgPicture.asset(
              "assets/images/logo.svg",
              fit: BoxFit.cover,
            )),
        actions: [
          IconButton(onPressed: (){
            authService.signOut();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => GetStarted()));
          }, icon: Icon(Icons.login_outlined, color: Colors.black,))
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 560),
                child: SizedBox(
                  height: 60,
                  width: 374,
                  child: Expanded(
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(34)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QuizScreen()));
                      },
                      child: const Text(
                        'START QUIZ',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      color: kColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
