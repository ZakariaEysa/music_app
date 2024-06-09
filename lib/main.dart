import 'package:flutter/material.dart';
import 'package:music_player2/Views/StartPage.dart';
import 'package:music_player2/serveses/FetchAudio.dart';
import 'package:music_player2/serveses/dosstie_list.dart';
import 'package:music_player2/serveses/sharedServises.dart';
import 'package:music_player2/serveses/staticVariables.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Views/Gallery_Page.dart';
import 'Views/Home_Page.dart';
import 'serveses/allsongs_list.dart';
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
  Future<void> requestPermission() async {
    final status = await Permission.audio.request();
    if (status == PermissionStatus.granted) {
      setState(() {
      permissionGranted = true;
      });
      await fetchAudios();
    } else {



    }
  }
  @override
  void initState() {
    super.initState();
     sharedInitlize();

    requestPermission();

  }

  @override
  Widget build(BuildContext context) {


    return const Startpage();
  }
}
