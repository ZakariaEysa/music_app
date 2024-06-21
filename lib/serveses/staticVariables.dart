
import 'package:on_audio_query/on_audio_query.dart';
import 'package:shared_preferences/shared_preferences.dart';
bool permissionGranted = false;
// late  OnAudioQuery audioQuery1;
List<SongModel> Favorites = [];
List<String> FavoritesUri=[];


List<SongModel> audios1=[];
 late SharedPreferences  prefs;
 List<String> imgList = [
  'assets/Wallpaper23.png',
  'assets/Wallpaper5.png',
  'assets/Wallpaper10.png',
  'assets/Wallpaper21.png',
  'assets/Rectangle 34.png',
];