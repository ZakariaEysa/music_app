
import 'package:flutter/material.dart';
import 'package:music_player2/serveses/dosstie_list.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';
import 'Views/Gallery_Page.dart';
import 'Views/Home_Page.dart';
import 'serveses/allsongs_list.dart';

late final OnAudioQuery audioQuery1;
late List<SongModel> audios1;
// will edit soon ...
void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _permissionGranted = false;
  int count =0;

  void initState()   {
    super.initState();
    _requestPermission();
    // await QuranWebServes().GetAllSongs();

  }
  Future<void> _requestPermission() async {
    final status = await Permission.audio.request();
    if (status == PermissionStatus.granted) {
      setState(() {
        _permissionGranted = true;
      });
      _fetchAudios();
    } else {
    }
  }

  Future<void> _fetchAudios() async {
    final audioQuery = OnAudioQuery();
    audios1 = await audioQuery.querySongs(
      sortType: null,
      orderType: OrderType.ASC_OR_SMALLER,
      uriType: UriType.EXTERNAL,
      ignoreCase: true,
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget homeWidget =Text("Please Allow Permission");

    if (count == 0) {
      if(_permissionGranted) {
        homeWidget =   Home_Page();
        count++;
      }
     else  {
          _requestPermission();

          if(_permissionGranted) {
            homeWidget =   Home_Page();
            count++;
          }


      }


    } else {

      homeWidget = _permissionGranted ? Gallery_Page() :  Text("Please Allow Permission");
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Gallery_Page.id: (context) => Gallery_Page(),
        Home_Page.id: (context) => Home_Page(),
        allsongs.id: (context) => const allsongs(),
        ElDossrieallsongs.id: (context) => const ElDossrieallsongs(),
      },
      theme: ThemeData.dark(),
      home:homeWidget





      //   home: Audio_Model(),
      // home: allsongs(),
    );
  }
}
