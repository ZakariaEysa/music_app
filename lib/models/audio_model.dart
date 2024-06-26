import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'common.dart';
import 'package:rxdart/rxdart.dart';


class Audio_Model extends StatefulWidget {
   Audio_Model({super.key,  URI,IMG});

  static String ?URI;
   static  String ?IMG;


   @override
  Audio_ModelState createState() => Audio_ModelState();

}

class Audio_ModelState extends State<Audio_Model> with WidgetsBindingObserver {





  final _player = AudioPlayer();



  @override
  void initState() {
    Audio_Model.IMG ??="assets/Wallpaper21.png";

    super.initState();
    ambiguate(WidgetsBinding.instance)!.addObserver(this);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.red,
      statusBarBrightness: Brightness.dark ,
    ));
    _init();
  }

  Future<void> _init() async {






       // Inform the operating system of our app's audio attributes etc.
    // We pick a reasonable default for an app that plays speech.
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    // Listen to errors during playback.
    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
          print('A stream error occurred: $e');
        });
    // Try to load audio from a source and catch any errors.
    try {

      await _player.setAudioSource(AudioSource.uri(Uri.parse(

          Audio_Model.URI!
        )));
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }

  @override
  void dispose() {
    ambiguate(WidgetsBinding.instance)!.removeObserver(this);
    // Release decoders and buffers back to the operating system making them
    // available for other apps to use.
    _player.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // Release the player's resources when not in use. We use "stop" so that
      // if the app resumes later, it will still remember what position to
      // resume from.
      _player.stop();
    }
  }

  /// Collects the data useful for displaying in a seek bar, using a handy
  /// feature of rx_dart to combine the 3 streams of interest into one.
  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          _player.positionStream,
          _player.bufferedPositionStream,
          _player.durationStream,
              (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));

  @override
  @override
  Widget build(BuildContext context) {

    return Scaffold(

        appBar:PreferredSize(
        preferredSize: const Size.fromHeight(50), child: AppBar(


          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('Playing Now',style: TextStyle(color: Colors.grey),),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back,color: Colors.grey),
            onPressed: () => Navigator.pop(context),
          ),
        ),  ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Audio_Model.IMG !),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Display play/pause button and volume/speed sliders.
                ControlButtons(_player),
                // Display seek bar. Using StreamBuilder, this widget rebuilds
                // each time the position, buffered position, or duration changes.
                StreamBuilder<PositionData>(
                  stream: _positionDataStream,
                  builder: (context, snapshot) {
                    final positionData = snapshot.data;
                    return SeekBar(
                      duration: positionData?.duration ?? Duration.zero,
                      position: positionData?.position ?? Duration.zero,
                      bufferedPosition: positionData?.bufferedPosition ?? Duration.zero,
                      onChangeEnd: _player.seek,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
  }

}

/// Displays the play/pause button and volume/speed sliders.
class ControlButtons extends StatelessWidget {
  final AudioPlayer player;

  const ControlButtons(this.player, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Opens volume slider dialog
        IconButton(
          icon: const Icon(Icons.volume_up,color: Colors.black,size: 45,),
          onPressed: () {
            showSliderDialog(
              context: context,
              title: "Adjust volume",
              divisions: 10,
              min: 0,
              max: 3,
              value: player.volume,
              stream: player.volumeStream,
              onChanged: player.setVolume,
            );
          },
        ),

        /// This StreamBuilder rebuilds whenever the player state changes, which
        /// includes the playing/paused state and also the
        /// loading/buffering/ready state. Depending on the state we show the
        /// appropriate button or loading indicator.
        StreamBuilder<PlayerState>(
          stream: player.playerStateStream,
          builder: (context, snapshot) {
            final playerState = snapshot.data;
            final processingState = playerState?.processingState;
            final playing = playerState?.playing;
            if (processingState == ProcessingState.loading ||
                processingState == ProcessingState.buffering) {
              return Container(
                margin: const EdgeInsets.all(8.0),
                width: 64.0,
                height: 64.0,
                child: const CircularProgressIndicator(),
              );
            } else if (playing != true) {
              return IconButton(
                icon: const Icon(Icons.play_arrow,color: Colors.black),
                iconSize: 84.0,
                onPressed: player.play,
              );
            } else if (processingState != ProcessingState.completed) {
              return IconButton(
                icon: const Icon(Icons.pause,color: Colors.black),
                iconSize: 64.0,
                onPressed: player.pause,
              );
            } else {
              return IconButton(
                icon: const Icon(Icons.replay,color: Colors.black),
                iconSize: 64.0,
                onPressed: () => player.seek(Duration.zero),
              );
            }
          },
        ),
        // Opens speed slider dialog
        StreamBuilder<double>(
          stream: player.speedStream,
          builder: (context, snapshot) => IconButton(


            icon: Text("${snapshot.data?.toStringAsFixed(1)}x",
                style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 40)),
            onPressed: () {
              showSliderDialog(
                context: context,
                title: "Adjust speed",
                divisions: 10,
                min: 0.5,
                max: 2,
                value: player.speed,
                stream: player.speedStream,
                onChanged: player.setSpeed,
              );
            },
          ),
        ),
      ],
    );
  }
}