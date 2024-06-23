import 'package:flutter/material.dart';
import 'package:music_player2/Views/StartPage.dart';
import 'package:music_player2/serveses/sharedServises.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: initializePrefs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                  child: Column(
                children: [
                  CircularProgressIndicator(),
                  Text("Please Wait while Retrieving The MP3 Files")
                ],
              )),
            );
          } else if (snapshot.hasError) {
            return Scaffold(
              body: Center(child: Text('Error: ${snapshot.error}')),
            );
          } else {
            return const start_page();
          }
        },
      ),
    );
  }
}
