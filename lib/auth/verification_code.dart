import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../widgets/default_button.dart';
import '../widgets/otp_input_field.dart';
import 'create_new_password.dart';

class VerificationCode extends StatefulWidget {
  const VerificationCode({super.key});

  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon : const Icon(Icons.arrow_back_ios_new),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
      ),
      body:Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - (defaultPadding*2),
          width: MediaQuery.of(context).size.width -(defaultPadding*2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Verification Code", style: Theme.of(context).textTheme.headlineLarge,),
              const SizedBox(height: 20,),
              Text("Please send the verification code we send to your email address", softWrap: true,style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: 50,),
              const OtpInputField(),
              Text("Resend in 00:10", style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: 50,),
              Align(
                alignment: Alignment.center,
                child: DefaultButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const CreateNewPassword()));
                }, text: "Enter"),

              )
            ],
          ),
        ),
      ),
    );
  }
}
