import 'package:flutter/material.dart';
import 'practice_screen.dart';
import 'package:get/get.dart';
import 'login_screen.dart';
import 'maile_screen.dart';
import 'choose_register.dart';
import 'authenicate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// import 'package:change_app_package_name/change_app_package_name.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:DefaultFirebaseOptions.currentPlatform,
  );
  // runApp(MyApp());
  runApp(GetMaterialApp(
    initialRoute: '/',
    home:LoginScreen(),getPages: [
       GetPage(name: '/', page:()=>LoginScreen()),
       GetPage(name: '/select', page: ()=>Register(),transition: Transition.leftToRightWithFade),
       GetPage(name:'/practice',page:()=>PracticeScreen(),transition: Transition.downToUp),
       GetPage(name: '/mailes', page:()=>MaileScreen()),
       GetPage(name:'/auth',page:()=>AuthScreen(),transition: Transition.downToUp),
    ],
    debugShowCheckedModeBanner: false,
  ));
}

// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         backgroundColor: Colors.blue,
//       ),
//       home: LoginScreen(),
//     );
//   }
// }