import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'phone_screen.dart';
import 'package:get/get.dart';
import 'practice_screen.dart';





class PinCodeScreen extends StatefulWidget{
  const PinCodeScreen({Key?key}) : super(key:key);

  @override 

  _PinCodeScreen createState() => _PinCodeScreen();
}


class _PinCodeScreen extends State<PinCodeScreen>{
  TextEditingController countryCode = TextEditingController();
  var phone = "";
  int count = 0;
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override 
  void initState(){
    countryCode.text = "+81";

    super.initState();
  }


  @override 
  Widget build(BuildContext context){
      var code = "";
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

    final pincontroler = TextEditingController();
    final formKey = GlobalKey<FormState>();
    
    void CompletePin()async{
      try{
           // Create a PhoneAuthCredential with the code
        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: PhoneScreen.verify, smsCode: code);

        // Sign the user in (or link) with the credential
        await auth.signInWithCredential(credential);

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
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // for(int i = 0;i < 1;i++)
            // Form( 
            //  key:formKey, 
             
             Column(
              children: [
                Pinput(
                // androidSmsAutofillMethod: AndroidSmsAutofillMethod.none,
                forceErrorState: true,
                errorText: count > 0 && pincontroler.text.length == 0  ? 'PIN番号が間違っています！！' : " ",
                onChanged:(value){
                    code = value;
                    print("Pin番号の"+ code);
                },
                // pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                // validator: (pin){
                //   print("Pin番号テスト" + code);
                //   if(pin == code){
                    
                //     showDialog(context: context, builder: (BuildContext context){
                //      return AlertDialog(
                //       title: Text("Result"),
                //       content: Text(pincontroler.text),
                //       actions: [
                //         TextButton(onPressed:(){
                //           Navigator.pop(context);
                //           Future.delayed(Duration(seconds:1));
                //         }, child: Text("OK")),
                //       ],
                //      );
                //   });

                //   CompletePin();
                //   }
                //   else if(count > 0 && pin != code &&  pincontroler.text.length == 0){
                //      return 'PIN番号が間違っています';
                //   }else{
                //     return "";
                //   }
                // },
                length:6,
                controller: pincontroler,
                defaultPinTheme: defaultPinTheme,
                // onCompleted:(value){
                //   print(pincontroler.text);

                //   print(value);



                // }
              ),

          SizedBox(height: 10),
          SizedBox(
            width: 150,
            height: 30,
            child:ElevatedButton(onPressed:()async{
              //  print(pincontroler.text);
              //  formKey.currentState!.validate();
              CompletePin();
               
               Future.delayed(Duration(seconds: 1));
               pincontroler.clear();
              
              //  count += 1;
            }, child:Text("Next"),style: ElevatedButton.styleFrom(backgroundColor: Colors.purple,shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(5))),)
          )
              ],
             ),
            // ), 
          
       
            ],
            ),
          
          // SizedBox(height: 10),
          // SizedBox(
          //   width: 150,
          //   height: 30,
          //   child:ElevatedButton(onPressed:()async{
          //      print(pincontroler.text);
          //      Future.delayed(Duration(seconds: 1));
          //      pincontroler.clear();
          //   }, child:Text("Next"),style: ElevatedButton.styleFrom(backgroundColor: Colors.purple,shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(5))),)
          // )
          ],)
        ],)
      ),
    );
  }
}