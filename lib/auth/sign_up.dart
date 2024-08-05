import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/default_button.dart';
import '../widgets/social_icon_login_row.dart';
import 'log_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                    child: Text("Create\nyour account", style: Theme.of(context).textTheme.headlineLarge,)),
                CustomTextField(controller: nameController, hintText: "Enter your Name"),
                CustomTextField(controller: emailController, hintText: "Email address"),
                CustomTextField(controller: passwordController, hintText: "Password"),
                CustomTextField(controller: confirmPasswordController, hintText: "Confirm Password"),
                DefaultButton(
                  onPressed: (){},
                  text: "Sign Up",
                ),
                Text("or sign up with", style: Theme.of(context).textTheme.bodySmall,),
                SocialIconLoginRow(
                  //Todo add firebase signup functionality.
                  onPressedApple: (){},
                  onPressedFacebook:(){} ,
                  onPressedGoogle: (){},
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Already have a account?"),
                    TextButton(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const LogIn()));
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