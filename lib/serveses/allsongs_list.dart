import 'package:flutter/material.dart';
import 'package:music_player2/models/audio_model.dart';

import '../main.dart';

class allsongs extends StatefulWidget {
  const allsongs({Key? key}) : super(key: key);
  static String id = "all_songs";

  @override
  State<allsongs> createState() => _allsongs();
}

class _allsongs extends State<allsongs> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Music List"),
        ),
        body: ListView.builder(
            itemCount: audios1.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: (){
                // print(audios1[index]);
                // print(audios1[index].duration);
                // print(audios1[index].fileExtension);
                // print(audios1[index].uri);


                        print("  ********* ");
                print(audios1[index]);
                        print("  ********* ");

                        print(audios1[index].album);
                        print("  ********* ");

                        print(audios1[index].artist);
                        print("  ********* ");

                        print(audios1[index].data);
                        print("  ********* ");





                        Audio_Model.URI=audios1[index].uri;


                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Audio_Model();

                },));




              },

              child: ListTile(
                    leading: Icon(Icons.music_note),
                    title: Text(audios1[index].title),
                    subtitle: Text(audios1[index].artist ?? ""),
                    trailing: Icon(Icons.more_horiz),
                  ),
            )),
      ),
    );
  }
}
