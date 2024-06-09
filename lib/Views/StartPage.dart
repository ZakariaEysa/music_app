
import 'package:flutter/material.dart';
import 'package:music_player2/serveses/FetchAudio.dart';
import 'package:music_player2/serveses/dosstie_list.dart';
import 'package:music_player2/serveses/sharedServises.dart';
import 'package:music_player2/serveses/staticVariables.dart';
import 'package:permission_handler/permission_handler.dart';

import '../serveses/allsongs_list.dart';
import 'Gallery_Page.dart';
import 'Home_Page.dart';

class Startpage extends StatefulWidget {

  const Startpage({super.key});


  @override
  State<Startpage> createState() => _StartpageState();
}

class _StartpageState extends State<Startpage> {


  @override
  void initState() {
    // TODO: implement initState


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget homeWidget = Text("Please Allow Permission");

    if (permissionGranted) {
      homeWidget = Home_Page();

    }
    else {

    }


    if(prefs.getInt('counter')==null) {
      homeWidget =   Home_Page();
    }
    else{
      homeWidget =   Gallery_Page();





    }









    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          Gallery_Page.id: (context) => Gallery_Page(),
          Home_Page.id: (context) => Home_Page(),
          allsongs.id: (context) => const allsongs(),
          ElDossrieallsongs.id: (context) => const ElDossrieallsongs(),
        },

        // initialRoute: homeWidget.runtimeType.toString(),
        theme: ThemeData.dark(),
        home:homeWidget





      //   home: Audio_Model(),
      // home: allsongs(),
    );
  }
}
