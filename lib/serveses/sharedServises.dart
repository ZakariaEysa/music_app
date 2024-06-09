import 'package:music_player2/serveses/staticVariables.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

Future<void> sharedInitlize() async {
  try {
    prefs = await SharedPreferences.getInstance();
  }catch (e){

    print(e);

  }
}

Future<void>incrindex() async {

  await prefs.setInt('counter', 1);


}
Future<void>dincrindex() async {

  await prefs.remove('counter');


}
