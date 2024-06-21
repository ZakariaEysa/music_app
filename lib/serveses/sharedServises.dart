import 'package:music_player2/serveses/staticVariables.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'FetchAudio.dart';

Future<void> FavouritesList_Set( List<String> Favorites ) async {




  await prefs.setStringList('Favourites', Favorites);






}
Future<void> initializePrefs() async {
  try {

    prefs = await SharedPreferences.getInstance();
    if (prefs.getInt('counter') == 1)  {
     await  fetchAudios();
    }
  } catch (e) {
    print('Error initializing preferences: $e');
  }
}

Future<void>incrindex() async {

  await prefs.setInt('counter', 1);


}
Future<void>dincrindex() async {

  await prefs.remove('counter');


}
