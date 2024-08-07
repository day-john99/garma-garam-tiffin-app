import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/default_button.dart';
import '../widgets/social_icon_login_row.dart';
import 'log_in.dart';

class SignUp extends StatefulWidget {
  final void Function() onTap;
  const SignUp({super.key, required this.onTap});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  signUserUp() async {

    //show loading circle
    showDialog(context: context, builder: (context){
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height - (defaultPadding*2),
            width: MediaQuery.of(context).size.width -(defaultPadding*2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                    child: Text("Create\nyour account", style: Theme.of(context).textTheme.headlineLarge,)),
                CustomTextField(controller: nameController, hintText: "Enter your Name"),
                const SizedBox(height: 20),
                CustomTextField(controller: emailController, hintText: "Email address"),
                const SizedBox(height: 20),
                CustomTextField(controller: passwordController, hintText: "Password"),
                const SizedBox(height: 20),
                CustomTextField(controller: confirmPasswordController, hintText: "Confirm Password"),
                const SizedBox(height: 20),
                DefaultButton(
                  onPressed: (){
                    signUserUp();
                  },
                  text: "Sign Up",
                ),
                const SizedBox(height: 20),
                // Text("or sign up with", style: Theme.of(context).textTheme.bodySmall,),
                // SocialIconLoginRow(
                // //add firebase signup functionality.
                //   onPressedApple: (){},
                //   onPressedFacebook:(){} ,
                //   onPressedGoogle: (){},
                // ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Already have a account?"),
                    TextButton(onPressed: (){
                      widget.onTap();
                    }, child: const Text("Log in"))
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