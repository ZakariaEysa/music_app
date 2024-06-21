import 'package:flutter/material.dart';
import 'package:music_player2/models/audio_model.dart';
import 'package:music_player2/serveses/staticVariables.dart';

import 'Custom_ListTile.dart';

class allsongs extends StatefulWidget {
  const allsongs({super.key});
  static String id = "all_songs";

  @override
  State<allsongs> createState() => _allsongs();
}

class _allsongs extends State<allsongs> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text("Music List"),
        ),
        body: ListView.builder(
            itemCount: audios1.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: (){









                        Audio_Model.URI=audios1[index].uri;


                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Audio_Model();

                },));




              },

              child:CustomListTile(name:  audios1[index].displayName ,artist: audios1[index].artist!)


            )),

    );
  }
}
