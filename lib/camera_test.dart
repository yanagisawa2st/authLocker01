import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraTest extends StatefulWidget{
  //  const CameraTest({Key?key,required this.camera,}) : super(key:key);

   const CameraTest({Key?key}) : super(key:key);


  //  final CameraDescription camera;

   @override 
   _CameraTest createState()=> _CameraTest();
}

class _CameraTest extends State<CameraTest>{
  //  late CameraController _controller;
  // late Future<void> _initializeControllerFuture;

   List<CameraDescription>? cameras;
   CameraController? cameraController;


  void startCamera()async{

      cameras = await availableCameras();

      cameraController = CameraController(cameras![1], ResolutionPreset.high,enableAudio: false);

      await cameraController?.initialize().then((value){
        if(!mounted){
          return;
        }
        setState(() {
          
        });

      }).catchError((e){
        print(e);
      });

    }

  @override
  void initState() {
    startCamera();
    super.initState();

  //   _controller = CameraController(
  //     カメラを指定
  //     widget.camera,
  //     解像度を定義
  //     ResolutionPreset.medium,
  //   );

  //   コントローラーを初期化
  //   _initializeControllerFuture = _controller.initialize();
  // }

  // @override
  // void dispose() {
  //   ウィジェットが破棄されたら、コントローラーを破棄
  //   _controller.dispose();
  //   super.dispose();

  }

  @override 
  void dispose(){
    cameraController?.dispose();
    super.dispose();
  }


  @override 
  Widget build(BuildContext context){

    

  


    // CameraController cameraController;
    // final cameras;
    // Future<void> _initializeController;
    // Stream<CameraController>accessCamera()async*{
    //    final cameras =  await availableCameras();
    //   final camera = cameras.first;

    //    cameraController = CameraController(camera, ResolutionPreset.high);
    //     cameraController.initialize();
    // }

    // accessCamera();
    if(cameraController!.value.isInitialized){
      return Scaffold(
         body:Stack(
          children:[
            CameraPreview(cameraController!),
          ]
         )
      );
    }else{
      return SizedBox();
    }
  }
}