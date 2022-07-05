import 'package:firebase_core/firebase_core.dart';
import 'package:quiz_app2/screens/forget_password.dart';
import 'package:quiz_app2/screens/get_started.dart';
import 'package:quiz_app2/screens/signin.dart';
import 'package:quiz_app2/screens/signup.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GetStarted(),
      routes: {
        SignIn.id : (context) => const SignIn(),
        SignUp.id: (context) => const SignUp(),
        GetStarted.id : (context) => const GetStarted(),
        ForgotPassword.id : (context) => const ForgotPassword(),

      },
    );
  }
}

