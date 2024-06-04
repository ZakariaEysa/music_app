import 'package:flutter/material.dart';
import 'package:music_player2/main.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'dart:convert';

import '../models/audio_model.dart';
List<SongModel> Favorites = [



];

// Map mp=Favorites.asMap();
// var s = json.encode(Favorites);



void FavouritesList_Get(){

  var value = prefs.getString('Favourites');

  print(value?.length);
  print(value);
// // Favorites = json.decode(value!);
//
//
//
//
//   if(value!=null){
//
//    // value=value.substring(1, value.length - 1);
//     //value=value.substring(1, value.length - 1);
//
//
//
//
//     try {
//      // String modifiedValue = value.substring(0, 1) + value.substring(2, value.length - 2) + value.substring(value.length - 1);
//
//
//       Map list = json.decode(modifiedValue);
//
//
//
//
//       print("wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww");
//
//
//       print(list[0]);
//       print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
//
//       //Favorites.clear();
//       // for (var item in list) {
//       //   Favorites.add(item);
//       //
//       //   print(Favorites.length);
//       // }




    //
    // } catch (e) {
    //   print('Error decoding JSON: $e');
    // }
    //










//  }




}










class FavouritesList extends StatelessWidget {
  const FavouritesList({super.key});


  @override
  Widget build(BuildContext context) {
    FavouritesList_Get();

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

