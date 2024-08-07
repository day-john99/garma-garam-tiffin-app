import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:garma_garam_tiffin_app/auth/auth_page.dart';
import 'package:garma_garam_tiffin_app/screens/discover_page.dart';
import 'package:garma_garam_tiffin_app/screens/home_page.dart';
import 'package:garma_garam_tiffin_app/screens/main_scaffold.dart';
import 'package:garma_garam_tiffin_app/screens/my_orders_page.dart';
import 'package:garma_garam_tiffin_app/screens/notification_page.dart';
import 'package:garma_garam_tiffin_app/screens/profile_page.dart';
import 'package:garma_garam_tiffin_app/utils/theme.dart';
import 'package:garma_garam_tiffin_app/widgets/app_drawer.dart';
import 'auth/create_new_password.dart';
import 'auth/forgot_password.dart';
import 'auth/log_in.dart';
import 'auth/sign_up.dart';
import 'auth/verification_code.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final runnableApp = _buildRunnableApp(
    isWeb: kIsWeb,
    webAppWidth: 380.0,
    app: const MyApp(),
  );
  runApp(runnableApp);
}

//this runs the app with a max width of 380, to emulate a
// mobile app behaviour, if ran on a desktop web browser
Widget _buildRunnableApp({
  required bool isWeb,
  required double webAppWidth,
  required Widget app,
}) {
  if (!isWeb) {
    return app;
  }
  return Center(
    child: ClipRect(
      child: SizedBox(
        width: webAppWidth,
        child: app,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: MaterialApp(
        title: 'FluxStore',
        theme: lightTheme,
        routes: {
          "/Auth" : (context) => const AuthPage(),
          // "/Login" : (context) => const LogIn(),
          // "/signup" : (context) => const SignUp(),
          // "/ForgotPassword" : (context) => const ForgotPassword(),
          // "/CreateNewPassword" : (context) => const CreateNewPassword(),
          // "/CodeVerification" : (context) => const VerificationCode(),

          "/home" : (context) => const HomeScreen(currentIndex: 0,),
          "/homePage" : (context) => const HomePage(),
          "/discover" : (context) => const DiscoverPage(),
          "/MyOrders" : (context) => const MyOrdersPage(),
          "/profile" : (context) => const ProfilePage(),

          "/drawer" : (context) => const MyAppDrawer(),
          "/notification" : (context) => const NotificationPage(),
        },

        ///set the route currently being worked on here.
        ///Default value will be "/Login"
        initialRoute: "/Auth",
      ),
    );
  }
}


