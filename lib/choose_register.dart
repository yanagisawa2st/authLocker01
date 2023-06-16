import 'package:flutter/material.dart';
import 'maile_screen.dart';
import 'phone_screen.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './models/controller.dart';

class Register extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
     var isAccount = Get.put(userController());
     Future<void> signInWithGoogle()async{
        FirebaseAuth auth = FirebaseAuth.instance;
        final GoogleSignIn googleSignIn = GoogleSignIn();
        final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

        final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken, 
          );

        final UserCredential userCredential = await auth.signInWithCredential(credential);
        isAccount.userRecog();
     }
    return Scaffold(
      
      body:Center(
        child:Column(
          
          children: [
            SizedBox(height: 250,),
            // Text("Select Register",style:TextStyle(fontSize: 25,color:Colors.redAccent[400])),
             Text("Wanks",style:TextStyle(fontSize: 25,color: Colors.blue,fontWeight: FontWeight.w600)),
               SizedBox(height: 5,),
               Text("~AIと連携した厳重なスマートロック~",style:TextStyle(color:Colors.blueGrey)),
               SizedBox(height: 15,),
             
              SizedBox(
                    width:350,
                    child:ElevatedButton.icon(icon:FaIcon(FontAwesomeIcons.google,color:Colors.white),label: Text("Googleアカウント"),onPressed: ()async{
                      await signInWithGoogle();

                       if(isAccount.isUser.value == true){
                        //  Get.toNamed('/practice');
                         Get.toNamed('/auth');

                       }
                    },style:ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent,shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),))
                  ),
               SizedBox(
                    width:350,
                    child:ElevatedButton.icon(icon:Icon(Icons.mail),label: Text("メールアドレス"),onPressed: (){
                      Get.toNamed('/mailes');
                    },style:ElevatedButton.styleFrom(backgroundColor: Colors.red,shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),))
                  ),
               SizedBox(
                    width:350,
                    child:ElevatedButton.icon(icon:Icon(Icons.call),label: Text("電話番号"),onPressed: (){
                       Get.toNamed('/phones');
                    },style:ElevatedButton.styleFrom(backgroundColor: Colors.green,shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),))
                  ),
               SizedBox(height: 15,),

               TextButton.icon(onPressed:(){
                Get.back();
               }, icon: Icon(Icons.chevron_left), label: Text("Go Back",style:TextStyle(color: Colors.grey[400])),style:TextButton.styleFrom(iconColor: Colors.grey[400]),)
        ],)
      )
    );
  }
}