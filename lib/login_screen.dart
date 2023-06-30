import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'choose_register.dart';

class LoginScreen extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body:SafeArea(
        child:Center(
          child:Opacity(opacity: 0.8,
           child:Padding(padding: EdgeInsets.only(top:20),
            child:Container(
            //  decoration:BoxDecoration(
            //   image:DecorationImage(
            //     image:NetworkImage("https://p.limia.jp/resize/o4/images/26483/gallery/17449/9fcc179d5086f6d1d685053c9e24b794.jpg"),
            //     fit:BoxFit.contain,
            //     alignment: Alignment.topCenter,
            //   ),
            //  ),
            
             child:Center(child: Column(children: [
               Text("Wanks",style:TextStyle(fontSize: 25,color: Colors.blue,fontWeight: FontWeight.w600)),
               SizedBox(height: 5,),
               Text("~AIと連携した厳重なスマートロック~",style:TextStyle(color:Colors.blueGrey)),
               SizedBox(height: 15,),
               Image.network("https://p.limia.jp/resize/o4/images/26483/gallery/17449/9fcc179d5086f6d1d685053c9e24b794.jpg"),
               SizedBox(height: 15,),
               Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height: 15,),
                  Text("Way of Next Page",style:TextStyle(color: Colors.green,fontSize: 25,fontWeight: FontWeight.w600)),
                  SizedBox(height: 15,),
                  SizedBox(
                    width:350,
                    child:ElevatedButton(onPressed:(){
                      //choose_register.dartのスクリーンに飛ぶ
                      Get.toNamed('/select');
                    }, child:Text("新規登録",style:TextStyle(color:Colors.white)),style:ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent,shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))))
                  ),
                  SizedBox(
                    width:350,
                    child:ElevatedButton(onPressed:(){}, child:Text("ログイン",style:TextStyle(color:Colors.green)),style:ElevatedButton.styleFrom(backgroundColor: Colors.white,shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),side:BorderSide(color:Colors.green,)))
                  ),
                  SizedBox(height: 15,),
                  Column(
                    children: [
                       TextButton(onPressed:(){}, child:Text("ログインまたは新規登録にお困りの方へ",style:TextStyle(color:Colors.blueGrey))),
                  // SizedBox(height: 10,),
                  TextButton(onPressed:(){}, child: Text("利用規約　　プライバシーポリシー",style:TextStyle(color:Colors.blueGrey)))
                    ],
                  )
               ],)
             ],),),
           ),
        ),
          ),
        ),
      ),
    );
  }
}