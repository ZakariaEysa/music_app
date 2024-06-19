import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:music_player2/main.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'dart:convert';
import '../models/audio_model.dart';
import '../serveses/custom_songmodel.dart';
import '../serveses/staticVariables.dart';

List<SongModel> Favorites = [];
List<String> FavoritesUri=[];





void FavouritesList_Get() {
  FavoritesUri = prefs.getStringList('Favourites') ?? [];
  for (SongModel song in audios1) {
    if (FavoritesUri.contains(song.uri)) {

      if(!Favorites.contains(song)){
        Favorites.add(song);


      }
    }
  }

  print(Favorites.length);
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
