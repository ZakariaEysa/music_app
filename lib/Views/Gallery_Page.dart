import 'package:flutter/material.dart';
import 'package:music_player2/Views/pupular_list_page.dart';
import '../serveses/Custom_Navigation_Bar.dart';
import 'carousel_slider.dart';
import '/serveses/allsongs_list.dart';

class Gallery_Page extends StatefulWidget {
  const Gallery_Page({super.key});

  @override
  _Gallery_PageState createState() => _Gallery_PageState();

  static String id = "Gallery_page";
}

class _Gallery_PageState extends State<Gallery_Page> {
  // static List <Widget> pages = [Home_Page() ,ElDossrieallsongs(),Gallery_Page(),allsongs() ];

  int currentIndexPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const Custmo_ButtomNavigatorBar(),
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          const Carousel_slider(currentIndexPage: 0),
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 10),
            child: Row(
              children: [
                const Text(
                  " Popular Singles",
                  style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                const Spacer(
                  flex: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15, bottom: 10, top: 5),
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, allsongs.id),
                    child: const Text(
                      "See all",
                      style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                          fontSize: 23),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Pupular_Singles_List(),
        ],
      ),
    );
  }
}
