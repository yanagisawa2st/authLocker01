import 'package:flutter/material.dart';
import 'practice_screen.dart';
import 'camera_test.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:local_auth/local_auth.dart';
import 'package:camera/camera.dart';

class AuthScreen extends StatefulWidget{
  const AuthScreen({
    Key? key,
  }) : super(key:key);
  @override 

  _AuthScreen createState() => _AuthScreen();
}


class _AuthScreen extends State<AuthScreen>{
  @override 
  Widget build(BuildContext context){
    bool checkBio;
    bool isGetAuth = false;

    ///7行目で指紋認証のためlocal_authをインポート
    ///LocalAuthenicationを初期化する
    LocalAuthentication auths = LocalAuthentication();

 


    Future<void>SignOut()async{
    final GoogleSignIn googleSingIn = GoogleSignIn();
    await googleSingIn.signOut();
   }

   Future<void>canCheckedBio()async{
      

      try{
        //指紋認証の権限があるデバイスかどうか判定する
        checkBio = await auths.canCheckBiometrics;
        print(checkBio);

      }on PlatformException catch(err){
        checkBio = false;
        print(err);
      }
   }


   Future<void>getAuth()async{
      print("スタート");
     try{
       print("テスト");
        //指紋認証を実装する。
        isGetAuth = await auths.authenticate(
          localizedReason: "Scan your finger print",
          options: const AuthenticationOptions(
            biometricOnly: true,
            useErrorDialogs: true,
            stickyAuth: true,
          )
          );
          print(isGetAuth.toString());
         if(isGetAuth != false){
           print("スキャン成功");
           Get.toNamed('/practice');
         }
     }on PlatformException catch(err){
       
     }

   }
  

   @override
    void initState(){
      super.initState();

      canCheckedBio();
    }

    return Scaffold(
      appBar: AppBar(
        title:Text("Home"),
        centerTitle: true,
        actions:[
          IconButton(onPressed:(){
             showDialog(context: context, builder:(BuildContext context){
                return AlertDialog(
                  title: Text("確認"),
                  content:Text("本当にサインアウトしてもよろしいでしょうか？"),
                  actions: [
                    TextButton(onPressed:()async{
                      await SignOut();
                      Get.toNamed("/");
                    }, child: Text("OK")),
                    TextButton(onPressed:(){
                      Navigator.pop(context);
                    }, child: Text("Cancel")),

                  ],
                );
             });
          }, icon: Icon(Icons.person))

        ]
      ),
      body:Center(
        child:Column(
          children: [
             SizedBox(height: 20,),
             Text("Scan Finger Print"),
             SizedBox(height: 10,),
             Image.network("https://img.icons8.com/fluency/512/fingerprint-recognition.png",width:150,height: 150,),
             SizedBox(height: 20,),
             SizedBox(
              width:100,
              height: 24,
              child:ElevatedButton(onPressed:(){
                //38行目の処理を走らせる。
                canCheckedBio();
                Future.delayed(Duration(seconds:1));
                //53行目の処理を走らせる
                getAuth();
              },child:Text("Start Scan",style:TextStyle(fontSize: 13)),style:ElevatedButton.styleFrom(backgroundColor: Colors.purpleAccent,shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),shadowColor: Colors.grey,elevation:8)),

             ),
              SizedBox(height: 10,),
                SizedBox(
              width:100,
              height: 24,
              child:ElevatedButton(onPressed:()async{
    
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:(context)=>CameraTest())
                );
              },child:Text("Go to Camera",style:TextStyle(fontSize: 13)),style:ElevatedButton.styleFrom(backgroundColor: Colors.purpleAccent,shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),shadowColor: Colors.grey,elevation:8)),

             ),
        
          ],
        )
      )
    );
  }
}