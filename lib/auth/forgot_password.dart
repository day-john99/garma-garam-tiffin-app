//todo uncomment when forgot password is live

// import 'package:flutter/material.dart';
// import 'package:garma_garam_tiffin_app/auth/verification_code.dart';
// import '../utils/constants.dart';
// import '../widgets/custom_text_field.dart';
// import '../widgets/default_button.dart';

// class ForgotPassword extends StatefulWidget {
//   const ForgotPassword({super.key});
//
//   @override
//   State<ForgotPassword> createState() => _ForgotPasswordState();
// }
//
// class _ForgotPasswordState extends State<ForgotPassword> {
//   TextEditingController emailController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//             icon : const Icon(Icons.arrow_back_ios_new),
//           onPressed: (){
//               Navigator.pop(context);
//           },
//         ),
//         backgroundColor: Colors.transparent,
//       ),
//       body:Center(
//         child: SizedBox(
//           height: MediaQuery.of(context).size.height - (defaultPadding*2),
//           width: MediaQuery.of(context).size.width -(defaultPadding*2),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("Forgot Password?",
//                 style: Theme.of(context).textTheme.headlineLarge,),
//               const SizedBox(height: 20,),
//               Text("Enter email associated with your account and "
//                   "we'll send and email with instructions to reset your password",
//                 softWrap: true,style: Theme.of(context).textTheme.bodySmall,),
//               const SizedBox(height: 50,),
//               CustomTextField(controller: emailController, hintText: "enter your email here", prefixIcon: const Icon(Icons.email_outlined),),
//               const SizedBox(height: 50,),
//               Align(
//                 alignment: Alignment.center,
//                 child: DefaultButton(
//                     onPressed: (){
//                       Navigator.push(context, MaterialPageRoute(builder: (context)=>const VerificationCode()));
//                     }, text: "Send"),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
