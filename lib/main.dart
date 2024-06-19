import 'package:flutter/material.dart';
import 'package:music_player2/Views/StartPage.dart';
import 'package:music_player2/serveses/FetchAudio.dart';
import 'package:music_player2/serveses/sharedServises.dart';
import 'package:music_player2/serveses/staticVariables.dart';
import 'package:permission_handler/permission_handler.dart';
// Obtain shared preferences.

// will edit soon ...
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100), () async {
    try {
      await      sharedInitlize();
    }catch (e){
      print(e);
    }



    });


       fetchAudios();


     super.initState();




  }

  @override
  Widget build(BuildContext context) {


    return const start_page();
  }
}
