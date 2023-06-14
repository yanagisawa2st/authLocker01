import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ObsConroller extends GetxController{
  var count = 0.obs;
  var name = "".obs;

  void Increment(){
    count.value += 1;
  }

  void Decrement(){    
    if(count.value > 0){
      count.value -= 1;
    }else{
      return;
    }
  }

  void Reset(){
    count.value = 0;
  }
}

class userController extends GetxController{
  var user = "".obs;
  var isUser = false.obs;

  void userRecog(){
    isUser.value = true;
    update();
  }
}