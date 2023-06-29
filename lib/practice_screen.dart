import 'package:flutter/material.dart';
import './models/controller.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

  var color = "test";


class PracticeScreen extends StatelessWidget{
  var xcontroller = Get.put(ObsConroller());
  // var phone = Get.parameters;
  @override 
  Widget build(BuildContext context){

  //  Future<void>SignOut()async{
  //   final GoogleSignIn googleSingIn = GoogleSignIn();
  //   await googleSingIn.signOut();
  //  }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
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
                      // await SignOut();
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
            SizedBox(height: 15,),
            Obx(()=>Text('カウント数:${xcontroller.count.value}')),
             SizedBox(height: 10,),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed:()=>xcontroller.Increment(), child: Text("+")),
                SizedBox(width: 5,),
                ElevatedButton(onPressed:()=>xcontroller.Decrement(), child: Text("-")),

              ],
             ),
        ],)
      )
    );
  }
}
