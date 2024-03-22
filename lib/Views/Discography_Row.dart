import 'package:flutter/material.dart';

import 'Gallery_Page.dart';

class Discography_Pics_row extends StatefulWidget {
  const Discography_Pics_row({
    super.key,
  });

  @override
  State<Discography_Pics_row> createState() => _Discography_Pics_rowState();
}

class _Discography_Pics_rowState extends State<Discography_Pics_row> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 191,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Row_Pictures(
            Pictures: "assets/Rectangle 32.png",
          ),
          Row_Pictures(
            Pictures: "assets/Rectangle 38.png",
          ),
          Row_Pictures(
            Pictures: "assets/Rectangle 39.png",
          ),
          Row_Pictures(
            Pictures: "assets/Rectangle 32.png",
          ),
          Row_Pictures(
            Pictures: "assets/Rectangle 38.png",
          ),
          Row_Pictures(
            Pictures: "assets/Rectangle 39.png",
          ),
          Row_Pictures(
            Pictures: "assets/Rectangle 32.png",
          ),
          Row_Pictures(
            Pictures: "assets/Rectangle 38.png",
          ),
          Row_Pictures(
            Pictures: "assets/Rectangle 39.png",
          ),
        ],
      ),
    );
  }
}
