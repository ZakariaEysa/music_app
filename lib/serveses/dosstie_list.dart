import 'package:flutter/material.dart';
import 'package:music_player2/models/audio_model.dart';
import 'package:music_player2/serveses/staticVariables.dart';

import 'Custom_Navigation_Bar.dart';

class ElDossrieallsongs extends StatefulWidget {
  const ElDossrieallsongs({super.key});
  static String id = "ElDossrieallsongs";

  @override
  State<ElDossrieallsongs> createState() => _allsongs();
}

class _allsongs extends State<ElDossrieallsongs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Music List"),
      ),
      bottomNavigationBar: const Custmo_ButtomNavigatorBar(),
      backgroundColor: Colors.black,
      body: ListView.builder(
          itemCount: 114,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  const base = "https://server11.mp3quran.net/yasser/";
                  int IIndex = index;
                  String Sindex = "$IIndex";
                  if (index < 10) {
                    Sindex = "00$IIndex";
                  } else if (index < 100 && index > 9) {
                    Sindex = "0$IIndex";
                  } else {}
                  final url = "$base$Sindex.mp3";

                  Audio_Model.URI = url;
                  Audio_Model.IMG = "assets/dossry1.jpeg";

                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Audio_Model();
                    },
                  ));
                },
                child: ListTile(
                  leading: const Icon(Icons.music_note),
                  title: Text(surahMap[++index].toString()),
                  subtitle: Text("$index"),
                  trailing: const Icon(Icons.more_horiz),
                ),
              )),
    );
  }
}
