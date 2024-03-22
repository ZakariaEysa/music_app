// import 'dart:async';
//
// import 'package:audioplayers/audioplayers.dart';
//
// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:get/get.dart';
// import 'package:on_audio_query/on_audio_query.dart';
// import 'package:permission_handler/permission_handler.dart';
//
//
//
//
// class PlayerController extends GetxController{
//
//   final audioQuory = OnAudioQuery();
//  void onInit() {
//    super.onInit();
//
//
//    checkPermissions();
//  }
//  checkPermissions() async {
//    var permission=await Permission.storage.request();
//    if(permission.isGranted){
//
//
//
//      print("Permission Granted");
//       return audioQuory.querySongs(ignoreCase:  true,orderType: OrderType.ASC_OR_SMALLER,sortType: null,uriType: UriType.EXTERNAL);
//
//
//    }else{
//      print("Permission Denied");
//      checkPermissions();
//
//    }
//
//
//
//
//  }
//
//
//
//
//
//
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
