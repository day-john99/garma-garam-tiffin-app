import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:garma_garam_tiffin_app/auth/log_in.dart';
import 'package:garma_garam_tiffin_app/auth/sign_up.dart';
import '../screens/main_scaffold.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            print("snapshot has data");
            return const HomeScreen(currentIndex: 0,);
          }
          else {
            print("nope ,no data");
            return const LogInOrSignUpPage();
          }
        },
      ),
    );
  }
}

class LogInOrSignUpPage extends StatefulWidget {
  const LogInOrSignUpPage({super.key});

  @override
  State<LogInOrSignUpPage> createState() => _LogInOrSignUpPageState();
}

class _LogInOrSignUpPageState extends State<LogInOrSignUpPage> {

  bool showLoginPage = true;

  void togglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showLoginPage) {
      return LogIn(
        onTap: togglePages,);
    } else {
      return SignUp(
          onTap: togglePages
      );
    }
  }
}
