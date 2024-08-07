//todo uncomment when setting new password is live

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import '../screens/main_scaffold.dart';
// import '../utils/constants.dart';
// import '../widgets/custom_text_field.dart';
// import '../widgets/default_button.dart';

// class CreateNewPassword extends StatefulWidget {
//   const CreateNewPassword({super.key});
//
//   @override
//   State<CreateNewPassword> createState() => _CreateNewPasswordState();
// }
//
// class _CreateNewPasswordState extends State<CreateNewPassword> {
//   TextEditingController newPasswordController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios_new),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         backgroundColor: Colors.transparent,
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           physics: const BouncingScrollPhysics(),
//           child: SizedBox(
//             height: MediaQuery.of(context).size.height - (defaultPadding * 2),
//             width: MediaQuery.of(context).size.width - (defaultPadding * 2),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Create a new password",
//                   style: Theme.of(context).textTheme.headlineLarge,
//                   softWrap: true,
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Text(
//                   "Your password must me different form the previously used password",
//                   softWrap: true,
//                   style: Theme.of(context).textTheme.bodySmall,
//                 ),
//                 const SizedBox(
//                   height: 50,
//                 ),
//                 CustomTextField(
//                   controller: newPasswordController,
//                   hintText: "New Password",
//                   obscureText: true,
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 CustomTextField(
//                   controller: confirmPasswordController,
//                   hintText: "Confirm Password",
//                   obscureText: true,
//                 ),
//                 const SizedBox(
//                   height: 50,
//                 ),
//                 Align(
//                   alignment: Alignment.center,
//                   child: DefaultButton(
//                       onPressed: () {
//                         //makes sure the keyboard is closed before showing the bottom sheet
//                         SystemChannels.textInput.invokeMethod('TextInput.hide');
//
//                         showModalBottomSheet(
//                             context: context,
//                             builder: (_) {
//                               return buildModalBottomSheet(context);
//                             });
//                       },
//                       text: "Enter"),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget buildModalBottomSheet(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 300,
//       decoration: const BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20), topRight: Radius.circular(20))),
//       child: Column(
//           children: [
//             const SizedBox(height: 20),
//             CircleAvatar(
//               radius: 50,
//               backgroundColor: Colors.grey[200],
//               child: const Center(child: Icon(Icons.done_all_sharp)),
//             ),
//             const SizedBox(height: 20),
//             const Text(
//               "Your Password has been Changed!",
//               softWrap: true,
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
//             ),
//             const SizedBox(height: 20),
//             SizedBox(
//             width: 200,
//             height: 40,
//             child: DefaultButton(
//                 onPressed: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen(currentIndex: 0,)));
//                   }, text: "Browse Home")
//             )
//       ]),
//     );
//   }
// }
