import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MaileScreen extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    TextEditingController _controller = TextEditingController();
    return Scaffold(
      
      body:Center(
        child:
        Column(children: [
          SizedBox(height: 120,),
          //  Image.network("https://media.istockphoto.com/id/901784730/ja/%E3%83%99%E3%82%AF%E3%82%BF%E3%83%BC/%E3%83%95%E3%83%A9%E3%83%83%E3%83%88%E3%81%AA%E3%83%87%E3%82%B6%E3%82%A4%E3%83%B3%E3%81%AE%E7%B4%99%E9%A3%9B%E8%A1%8C%E6%A9%9F.jpg?s=612x612&w=0&k=20&c=U7u3cJZHIBfcF4XCAs_aABmGrNjA2k2Mz5q9x7Ey0iI=",width: 300,height: 200,),
          Image.network('https://media.istockphoto.com/id/1019177688/ja/%E3%83%99%E3%82%AF%E3%82%BF%E3%83%BC/%E9%81%8B%E5%8B%95%E7%AD%89%E5%B0%BA%E6%80%A7%E3%81%AE%E7%B4%99%E9%A3%9B%E8%A1%8C%E6%A9%9F.jpg?s=612x612&w=0&k=20&c=SUdcjea66KEOfkztbFsJxnCXb05RmUT8MD0lJaR_3-s=',width: 250,height: 150),
          SizedBox(height: 15,),
          Text("Please enter e-mail"),
          // SizedBox(height:20,),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            SizedBox(
              width: 200,
            child:TextField(
            controller:_controller,
            decoration: InputDecoration(
              labelText: "e-mail"
            ),
            ),
          ),
          SizedBox(
            width: 15,
            height: 15,
            child:IconButton(onPressed:(){}, icon:FaIcon(FontAwesomeIcons.paperPlane,color:Colors.blue)),
          )
          ],)
        ],)
      ),
    );
  }
}