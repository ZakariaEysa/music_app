import 'package:flutter/material.dart';
import 'package:music_player2/serveses/dosstie_list.dart';
import 'package:music_player2/serveses/staticVariables.dart';
import '../serveses/FetchAudio.dart';
import '../serveses/allsongs_list.dart';
import 'Gallery_Page.dart';
import 'Home_Page.dart';

class start_page extends StatefulWidget {
  const start_page({super.key});

  @override
  State<start_page> createState() => _start_pageState();
}

class _start_pageState extends State<start_page> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget homeWidget = const Text("Please Allow Permission");

    if (prefs.getInt('counter') == null) {
      homeWidget = Home_Page();
    } else {
      Future.delayed(const Duration(milliseconds: 100), () async {
        await fetchAudios();
      });
      homeWidget = Gallery_Page();
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          Gallery_Page.id: (context) => Gallery_Page(),
          Home_Page.id: (context) => Home_Page(),
          allsongs.id: (context) => const allsongs(),
          ElDossrieallsongs.id: (context) => const ElDossrieallsongs(),
        },
        theme: ThemeData.dark(),
        home: homeWidget);
  }
}
