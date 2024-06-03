import 'package:flutter/material.dart';
import 'package:music_player2/models/audio_model.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../Views/Favourites_list.dart';
import '../Views/Gallery_Page.dart';
import '../main.dart';

class ElDossrieallsongs extends StatefulWidget {
  const ElDossrieallsongs({Key? key}) : super(key: key);
  static String id = "ElDossrieallsongs";

  @override
  State<ElDossrieallsongs> createState() => _allsongs();
}

class _allsongs extends State<ElDossrieallsongs> {
  Map<int, String> surahMap = {
    1: 'الفاتحة',
    2: 'البقرة',
    3: 'آل عمران',
    4: 'النساء',
    5: 'المائدة',
    6: 'الأنعام',
    7: 'الأعراف',
    8: 'الأنفال',
    9: 'التوبة',
    10: 'يونس',
    11: 'هود',
    12: 'يوسف',
    13: 'الرعد',
    14: 'إبراهيم',
    15: 'الحجر',
    16: 'النحل',
    17: 'الإسراء',
    18: 'الكهف',
    19: 'مريم',
    20: 'طه',
    21: 'الأنبياء',
    22: 'الحج',
    23: 'المؤمنون',
    24: 'النور',
    25: 'الفرقان',
    26: 'الشعراء',
    27: 'النمل',
    28: 'القصص',
    29: 'العنكبوت',
    30: 'الروم',
    31: 'لقمان',
    32: 'السجدة',
    33: 'الأحزاب',
    34: 'سبأ',
    35: 'فاطر',
    36: 'يس',
    37: 'الصافات',
    38: 'ص',
    39: 'الزمر',
    40: 'غافر',
    41: 'فصلت',
    42: 'الشورى',
    43: 'الزخرف',
    44: 'الدخان',
    45: 'الجاثية',
    46: 'الأحقاف',
    47: 'محمد',
    48: 'الفتح',
    49: 'الحجرات',
    50: 'ق',
    51: 'الذاريات',
    52: 'الطور',
    53: 'النجم',
    54: 'القمر',
    55: 'الرحمن',
    56: 'الواقعة',
    57: 'الحديد',
    58: 'المجادلة',
    59: 'الحشر',
    60: 'الممتحنة',
    61: 'الصف',
    62: 'الجمعة',
    63: 'المنافقون',
    64: 'التغابن',
    65: 'الطلاق',
    66: 'التحريم',
    67: 'الملك',
    68: 'القلم',
    69: 'الحاقة',
    70: 'المعارج',
    71: 'نوح',
    72: 'الجن',
    73: 'المزمل',
    74: 'المدثر',
    75: 'القيامة',
    76: 'الإنسان',
    77: 'المرسلات',
    78: 'النبأ',
    79: 'النازعات',
    80: 'عبس',
    81: 'التكوير',
    82: 'الإنفطار',
    83: 'المطففين',
    84: 'الإنشقاق',
    85: 'البروج',
    86: 'الطارق',
    87: 'الأعلى',
    88: 'الغاشية',
    89: 'الفجر',
    90: 'البلد',
    91: 'الشمس',
    92: 'الليل',
    93: 'الضحى',
    94: 'الشرح',
    95: 'التين',
    96: 'العلق',
    97: 'القدر',
    98: 'البينة',
    99: 'الزلزلة',
    100: 'العاديات',
    101: 'القارعة',
    102: 'التكاثر',
    103: 'العصر',
    104: 'الهمزة',
    105: 'الفيل',
    106: 'قريش',
    107: 'الماعون',
    108: 'الكوثر',
    109: 'الكافرون',
    110: 'النصر',
    111: 'المسد',
    112: 'الإخلاص',
    113: 'الفلق',
    114: 'الناس',
  };


  @override
  Widget build(BuildContext context) {


    // final player = AudioPlayer();                   // Create a player
    // final duration = await player.setUrl(           // Load a URL
    //     'https://foo.com/bar.mp3');                 // Schemes: (https: | file: | asset: )
    // player.play();                                  // Play without waiting for completion
    // await player.play();                            // Play while waiting for completion
    // await player.pause();                           // Pause but remain ready to play
    // await player.seek(Duration(second: 10));        // Jump to the 10 second position
    // await player.setSpeed(2.0);                     // Twice as fast
    // await player.setVolume(0.5);                    // Half as loud
    // await player.stop();                            // Stop and free resources
    return  Scaffold(
        appBar: AppBar(
          title: Text("Music List"),
        ),
    bottomNavigationBar: const Custmo_ButtomNavigatorBar(),
    backgroundColor: Colors.black,
        body: ListView.builder(
            itemCount: 114,
            itemBuilder: (context, index) => GestureDetector(
              onTap: (){
                const base="https://server11.mp3quran.net/yasser/";
                int  IIndex=index;
                String  Sindex="$IIndex";
                if(index<10){

                  Sindex="00$IIndex";
                }
                else if (index<100&&index>9){

                  Sindex="0$IIndex";
                }
                else {}
                final url="$base$Sindex.mp3";

                // print(url);
                // print("  **************** ");

                // SongModel ss = SongModel();
                // ss.uri = url;
                //
                // Favorites.add(SongModel().uri=url);




                Audio_Model.URI=url;




                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Audio_Model();

                },));




              },

              child: ListTile(
                leading: Icon(Icons.music_note),
                title: Text(surahMap[++index].toString()),
                subtitle: Text("$index"),
                trailing: Icon(Icons.more_horiz),
              ),
            )),

    );
  }
}
