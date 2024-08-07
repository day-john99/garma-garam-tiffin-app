import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:garma_garam_tiffin_app/auth/sign_up.dart';
import '../utils/constants.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/default_button.dart';

class LogIn extends StatefulWidget {
  final void Function() onTap;
  const LogIn({super.key, required this.onTap});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  loginUser() async {

    //show loading circle
    showDialog(context: context, builder: (context){
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.value.text,
          password: passwordController.value.text
      );
      //get rid of the loading circle
      if (mounted) {
        Navigator.pop(context);
      }
    } catch (e){
      if (mounted){
        //get rid of the loading circle
        Navigator.pop(context);
        showDialog(context: context, builder: (context){
          return AlertDialog(
            title: const Text("Error"),
            content: Text(e.toString()),
            actions: [
              TextButton(onPressed: (){Navigator.pop(context);}, child: const Text("ok"))
            ],
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          //physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height - (defaultPadding*2),
            width: MediaQuery.of(context).size.width -(defaultPadding*2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Login into\nyour account", style: Theme.of(context).textTheme.headlineLarge,)),
                const SizedBox(height: 20),
                CustomTextField(
                    controller: emailController,
                    hintText: "Email address"),
                const SizedBox(height: 20),
                CustomTextField(
                    controller: passwordController,
                    obscureText: true,
                    hintText: "Password",
                ),
                const SizedBox(height: 20),
                // Align(
                //     alignment : Alignment.centerRight,
                //     child: GestureDetector(
                //       onTap: (){
                //         Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const ForgotPassword()));
                //       },
                //         child: Text("Forgot password?", style: Theme.of(context).textTheme.bodySmall,))),
                DefaultButton(
                  onPressed: (){
                    loginUser();
                  },
                  text: "Login",
                ),
                //Text("or login with", style: Theme.of(context).textTheme.bodySmall,),
                // SocialIconLoginRow(
                // implement firebase login functionality
                //   onPressedApple: (){},
                //   onPressedFacebook:(){} ,
                //   onPressedGoogle: (){},
                // ),
                const SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Don't have a account?"),
                    TextButton(
                        onPressed: (){
                          print("pressed");
                      widget.onTap();
                    }, child: const Text("Sign Up"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}