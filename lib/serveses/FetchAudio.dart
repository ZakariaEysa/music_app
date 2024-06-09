import 'package:flutter/material.dart';
import 'package:music_player2/serveses/staticVariables.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../main.dart';
Future<void> fetchAudios() async {
  final audioQuery =   OnAudioQuery();
  audios1 = await audioQuery.querySongs(
    sortType: null,
    orderType: OrderType.ASC_OR_SMALLER,
    uriType: UriType.EXTERNAL,
    ignoreCase: true,

  );





}