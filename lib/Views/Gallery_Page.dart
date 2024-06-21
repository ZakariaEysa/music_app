import 'package:flutter/material.dart';
import '../models/audio_model.dart';
import '../serveses/Custom_Navigation_Bar.dart';
import '../serveses/sharedServises.dart';
import '../serveses/staticVariables.dart';
import 'carousel_slider.dart';
import '/serveses/allsongs_list.dart';

class Gallery_Page extends StatefulWidget {
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
                print(audios1[index].uri);
                if (FavoritesUri.contains(audios1[index].uri)||Favorites.contains(audios1[index])) {
                  FavoritesUri.remove(audios1[index].uri);
                  print(audios1[index]);

                  Favorites.removeWhere((audio) => audio.uri == audios1[index].uri);
                  //     Favorites.remove(audios1[index]);
                  FavouritesList_Set(FavoritesUri);

                  print("removed");
                  print(FavoritesUri);
                  print(Favorites.length);







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
                  Audio_Model.IMG = null;
                  Audio_Model.URI = null;
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

    return Container(
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
                      '${Pictures}',
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



class Row_Pictures extends StatelessWidget {
  Row_Pictures({super.key, this.Pictures});

  String? Pictures;

  @override
  Widget build(BuildContext context) {
    Pictures ??= "assets/Rectangle 32.png";
    return Container(
        margin: const EdgeInsets.all(10),
        height: 300,
        width: 130,
        child: Column(
          children: [
            Image.asset(
              '$Pictures',
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                margin: const EdgeInsets.only(left: 7),
                alignment: Alignment.bottomLeft,
                child: const Text(
                  "Dead inside",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ))
          ],
        ));
  }
}
