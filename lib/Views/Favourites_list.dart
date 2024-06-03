import 'package:flutter/material.dart';
import 'package:music_player2/main.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../models/audio_model.dart';
List<SongModel> Favorites = [



];

// void ReadFav(){
//
//
//   List<String>? favUris = prefs.getStringList('Favourites');
//   if (favUris != null) {
//     Favorites = favUris.map((uri) => SongModel.fromUri(uri)).toList();
//   }
// }










class FavouritesList extends StatelessWidget {
  const FavouritesList({super.key});


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Music List"),
      ),
      body: ListView.builder(
          itemCount: Favorites.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: (){
              // print(Favorites[index]);
              // print(Favorites[index].duration);
              // print(Favorites[index].fileExtension);
              // print(Favorites[index].uri);


              print("  ********* ");
              print(Favorites[index]);
              print("  ********* ");

              print(Favorites[index].album);
              print("  ********* ");

              print(Favorites[index].artist);
              print("  ********* ");

              print(Favorites[index].data);
              print("  ********* ");





              Audio_Model.URI=Favorites[index].uri;


              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Audio_Model();

              },));




            },

            child: ListTile(
              leading: Icon(Icons.music_note),
              title: Text(Favorites[index].title),
              subtitle: Text(Favorites[index].artist ?? ""),
              trailing: Icon(Icons.more_horiz),
            ),
          )),

    );
  }
}

