import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:music_player2/main.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'dart:convert';
import '../models/audio_model.dart';
import '../serveses/custom_songmodel.dart';
import '../serveses/staticVariables.dart';

List<SongModel> Favorites = [];





void FavouritesList_Get() {



   String? apiResponse = prefs.getString('Favourites');

   String fixApiResponse(String apiResponse) {
     // Replace <unknown> with null
     apiResponse = apiResponse.replaceAll('<unknown>', 'null');

     // Replace double quotes (") with single quotes (') inside content URIs
     apiResponse = apiResponse.replaceAllMapped(
         RegExp(r'content://.+'), (match) => match.group(0)!.replaceAll('"', "'"));

     // Replace single quotes (') with double quotes (") for keys and values
     apiResponse = apiResponse.replaceAllMapped(
         RegExp(r'\{.+?\}'), (match) => match.group(0)!.replaceAll("'", '"'));

     return apiResponse;
   }


   String correctJson =fixApiResponse(apiResponse!);
   correctJson=correctJson!.replaceAll("'", '"');


   // dynamic jsonResponse = jsonDecode(correctJson);

   // print(jsonResponse[0]["_uri"]);

  List<CustomSongModel> songList = CustomSongModel.fromJsonString(correctJson);

  // var value = prefs.getString('Favourites');
  //
  //
  // String? apiResponse = prefs.getString('Favourites');
  // Response response = jsonDecode(apiResponse!);
  // // List<CustomSongModel> songList = CustomSongModel.fromJsonList(jsonResponse);
  //
  //
  // print(response.data);
  //
  //
  // var z = jsonDecode(value!);
  //
  // print("this is zz");
  // print(z);
  // print("end of  zz");

//       //Favorites.clear();
//       // for (var item in list) {
//       //   Favorites.add(item);
//       //
//       //   print(Favorites.length);
//       // }
}

class FavouritesList extends StatelessWidget {
  const FavouritesList({super.key});

  @override
  Widget build(BuildContext context) {
    FavouritesList_Get();

    return Scaffold(
      appBar: AppBar(
        title: Text("Music List"),
      ),
      body: ListView.builder(
          itemCount: Favorites.length,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Audio_Model.URI = Favorites[index].uri;

                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Audio_Model();
                    },
                  ));
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
