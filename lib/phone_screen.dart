import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';


class PhoneScreen extends StatefulWidget{
  const PhoneScreen({Key?key}) : super(key:key);

  static String verify = "";

  @override 
  _PhoneScreen createState() => _PhoneScreen();
}


class _PhoneScreen extends State<PhoneScreen>{

  //inputFieldに入力した電話番号の頭である国別コードを記憶するための変数
  TextEditingController countryCode = TextEditingController();
  //inputFieldに入力した電話番号を記憶するための変数
  var phone = "";

  @override 
  void initState(){
    //国別のコード。日本は+81から始まるようになっている
    countryCode.text = "+81";

    super.initState();
  }
 

  @override 
  Widget build(BuildContext context){


     
    
      
    return Scaffold(
      
      body:Center(
        child:
        Column(children: [
          SizedBox(height: 120,),
          //  Image.network("https://media.istockphoto.com/id/901784730/ja/%E3%83%99%E3%82%AF%E3%82%BF%E3%83%BC/%E3%83%95%E3%83%A9%E3%83%83%E3%83%88%E3%81%AA%E3%83%87%E3%82%B6%E3%82%A4%E3%83%B3%E3%81%AE%E7%B4%99%E9%A3%9B%E8%A1%8C%E6%A9%9F.jpg?s=612x612&w=0&k=20&c=U7u3cJZHIBfcF4XCAs_aABmGrNjA2k2Mz5q9x7Ey0iI=",width: 300,height: 200,),
          Image.network('https://img.freepik.com/free-vector/calling-concept-illustration_114360-3356.jpg?w=2000',width: 250,height: 150),
          SizedBox(height: 15,),
          Text("Please enter your Phone Number",style:TextStyle(color:Colors.green,fontSize: 18,fontWeight: FontWeight.w600)),
          SizedBox(height:20,),
          Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            SizedBox(
              width: 250,
              height: 30,
            child:TextField(
            keyboardType: TextInputType.phone,
            onChanged: (value){
              phone = value;
            },
            decoration: InputDecoration(
              labelText: "+80 | Phone Number",
              border:OutlineInputBorder(),

            ),
            ),
          ),
        
          SizedBox(height: 10),
          SizedBox(
            width: 150,
            height: 30,
            child:ElevatedButton(onPressed:()async{
              //二段階認証の実装
              await FirebaseAuth.instance.verifyPhoneNumber(
                             //inputFieldで入力した電話番号
                             phoneNumber: '${countryCode.text + phone}',
                             verificationCompleted: (PhoneAuthCredential credential) {
                                   
                             },
                             verificationFailed: (FirebaseAuthException e) {
                              if(e.code == 'invalid-phone-number'){
                                 showDialog(context: context, builder:(BuildContext context){
                                  return AlertDialog(
                                    title:Text("Warning!!!",style:TextStyle(color:Colors.green)),
                                    content:Text("電話番号が正しくありません",style:TextStyle(fontWeight: FontWeight.w400)),
                                    actions:[
                                      TextButton(onPressed:(){
                                        Navigator.pop(context);
                                      }, child:Text("OK"))
                                    ]
                                  );
                                 });
                              }
                             },
                             //電話番号が実在すればcodeSentが走り、PIN(確認コード)の画面に遷移する。
                             codeSent: (String verificationId, int? resendToken) {
                                //画面遷移時に電話番号の認証が成功したことを示すverificationIdを値渡しするためにクラス名.verifyとしている
                                PhoneScreen.verify = verificationId;
                                //pincode_screen.dartに画面遷移
                                Get.toNamed('/pin');
                             },
                             codeAutoRetrievalTimeout: (String verificationId) {},
                             );
            }, child:Text("Next"),style: ElevatedButton.styleFrom(backgroundColor: Colors.purple,shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(5))),)
          )
          ],)
        ],)
      ),
    );
  }
}