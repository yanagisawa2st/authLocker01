import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'phone_screen.dart';
import 'package:get/get.dart';
import 'practice_screen.dart';



 //PIN番号(確認コード)の画面のレイアウトは２行目でインプットしたpinputパッケージを使っている。

class PinCodeScreen extends StatefulWidget{
  const PinCodeScreen({Key?key}) : super(key:key);

  @override 

  _PinCodeScreen createState() => _PinCodeScreen();
}


class _PinCodeScreen extends State<PinCodeScreen>{
  TextEditingController countryCode = TextEditingController();
  var phone = "";
  int count = 0;
  // var para_phone = Get.arguments;
  
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override 
  void initState(){
    countryCode.text = "+81";

    super.initState();
  }


  @override 
  Widget build(BuildContext context){
      //入力したPIN番号を入れるための変数
      var code = "";
      //PinThemeで入力のレイアウトの横幅や高さ、ボーダーラインなどのデザインを設定
     final defaultPinTheme = PinTheme(
      width: 45,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border:Border.all(color: Colors.grey)
        
        
      ),
    );
    
    //PIN番号用のコントローラーを設定
    final pincontroler = TextEditingController();
    final formKey = GlobalKey<FormState>();
    
    void CompletePin()async{
      try{
           // Create a PhoneAuthCredential with the code
           ///以下の二つの引数を入れて信頼性の高い認証を作成
           ///１、verificationId・・・電話番号の認証が成功したことを示すID。画面遷移前に値渡し用に設定したPhoneScreen.verify
           ///２、smsCode・・・入力したPIN番号のデータ
        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: PhoneScreen.verify, smsCode: code);

        //↑で作成した信頼性の高い認証を引数に入れてログイン処理
        await auth.signInWithCredential(credential);
        
        //二段階認証を完了するとpractice_screen.dartに画面遷移する
        Get.toNamed('/practice');

        
      }catch(err){
        print(err);
        count += 1;

      }
    }


    return Scaffold(

     
      body:Center(
        child:
        Column(children: [
          SizedBox(height: 120,),
          //  Image.network("https://media.istockphoto.com/id/901784730/ja/%E3%83%99%E3%82%AF%E3%82%BF%E3%83%BC/%E3%83%95%E3%83%A9%E3%83%83%E3%83%88%E3%81%AA%E3%83%87%E3%82%B6%E3%82%A4%E3%83%B3%E3%81%AE%E7%B4%99%E9%A3%9B%E8%A1%8C%E6%A9%9F.jpg?s=612x612&w=0&k=20&c=U7u3cJZHIBfcF4XCAs_aABmGrNjA2k2Mz5q9x7Ey0iI=",width: 300,height: 200,),
          Image.network('https://img.freepik.com/free-vector/calling-concept-illustration_114360-3356.jpg?w=2000',width: 250,height: 150),
          SizedBox(height: 15,),
          Text("Please enter SMS code",style:TextStyle(color:Colors.green,fontSize: 18,fontWeight: FontWeight.w600)),
          SizedBox(height:20,),
          Column(
           
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            
             
             Column(
              children: [
                Pinput(
                
                forceErrorState: true,
                errorText: count > 0 && pincontroler.text.length == 0  ? 'PIN番号が間違っています！！' : " ",
                onChanged:(value){
                    code = value;
                    print("Pin番号の"+ code);
                },
             
                length:6,
                controller: pincontroler,
                defaultPinTheme: defaultPinTheme,
               
              ),

          SizedBox(height: 10),
          SizedBox(
            width: 150,
            height: 30,
            child:ElevatedButton(onPressed:()async{
              
              CompletePin();
               
               Future.delayed(Duration(seconds: 1));
               //ボタンを押し、ピンコードの処理を終えた後、入力したPINコードを空にする。
               pincontroler.clear();
              
              
            }, child:Text("Next"),style: ElevatedButton.styleFrom(backgroundColor: Colors.purple,shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(5))),)
          )
              ],
             ),
            
          
       
            ],
            ),
          
      
          ],)
        ],)
      ),
    );
  }
}