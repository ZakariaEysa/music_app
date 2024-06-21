import 'package:flutter/material.dart';

import '../models/audio_model.dart';
import '../serveses/sharedServises.dart';
import '../serveses/staticVariables.dart';

class Pupular_Singles_List extends StatefulWidget {
  const Pupular_Singles_List({super.key});

  @override
  State<Pupular_Singles_List> createState() => _Pupular_Singles_ListState();
}

class _Pupular_Singles_ListState extends State<Pupular_Singles_List> {
  @override
  Widget build(BuildContext context) {
    int counter;
    if (audios1.length > 10) {
      counter = 10;
    } else {
      counter = audios1.length;
    }
    return SizedBox(
      width: double.infinity,
      height: 400,
      child: ListView.builder(
        itemCount: counter,
        itemBuilder: (context, index) {
          return GestureDetector(
            onDoubleTap: () {
              setState(() {
                if (FavoritesUri.contains(audios1[index].uri) ||
                    Favorites.contains(audios1[index])) {
                  FavoritesUri.remove(audios1[index].uri);
                  Favorites.removeWhere(
                      (audio) => audio.uri == audios1[index].uri);
                  FavouritesList_Set(FavoritesUri);
                } else {
                  FavoritesUri.add(audios1[index].uri!);
                  Favorites.add(audios1[index]);
                  FavouritesList_Set(FavoritesUri);
                }
              });
            },
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  // Audio_Model.IMG = null;
                  // Audio_Model.URI = null;
                  Audio_Model.URI = audios1[index].uri;
                  Audio_Model.IMG = "assets/Wallpaper21.png";
                  return Audio_Model();
                },
              ));
            },
            child: Pupular_Singles(
              Textt: audios1[index].displayName,
              Pictures: "assets/Rectangle 32.png",
            ),
          );
        },
      ),
    );
  }
}

class Pupular_Singles extends StatelessWidget {
  Pupular_Singles({super.key, this.Pictures, this.Textt});

  String? Pictures;
  String? Textt;

  @override
  Widget build(BuildContext context) {
    Pictures ??= "assets/Rectangle 32.png";

    return SizedBox(
      width: double.infinity,
      height: 120,
      child: Padding(
          padding: const EdgeInsets.all(17),
          child: Row(
            children: [
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Image.asset(
                      '$Pictures',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    width: 224,
                    padding: const EdgeInsets.only(left: 13),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      Textt!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              const Spacer(
                flex: 1,
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white70,
                    size: 45,
                  )),
            ],
          )),
    );
  }
}
