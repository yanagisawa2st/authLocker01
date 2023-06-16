import 'package:flutter/material.dart';
import 'practice_screen.dart';
import 'package:get/get.dart';
import 'login_screen.dart';
import 'maile_screen.dart';
import 'phone_screen.dart';
import 'choose_register.dart';
import 'authenicate.dart';
import 'pincode_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:camera/camera.dart';
// import 'package:change_app_package_name/change_app_package_name.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:DefaultFirebaseOptions.currentPlatform,
  );

  WidgetsFlutterBinding.ensureInitialized();

  

  // runApp(MyApp());
  runApp(GetMaterialApp(
    initialRoute: '/',
    home:LoginScreen(),getPages: [
       GetPage(name: '/', page:()=>LoginScreen()),
       GetPage(name: '/select', page: ()=>Register(),transition: Transition.leftToRightWithFade),
       GetPage(name:'/practice',page:()=>PracticeScreen(),transition: Transition.downToUp),
       GetPage(name: '/mailes', page:()=>MaileScreen(),transition: Transition.downToUp),
       GetPage(name: '/phones', page: ()=>PhoneScreen(),transition: Transition.downToUp),
       GetPage(name: '/pin', page: ()=>PinCodeScreen(),transition: Transition.downToUp),
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
