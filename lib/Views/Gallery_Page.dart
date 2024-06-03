import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../main.dart';
import '../models/audio_model.dart';
import '../serveses/dosstie_list.dart';
import 'Favourites_list.dart';
import 'Home_Page.dart';
import 'carousel_slider.dart';
import '/serveses/allsongs_list.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

Future<void> FavouritesList_update( List<SongModel> Favorites ) async {


await prefs.setStringList('Favourites', Favorites.map((e) => e.uri!).toList());

}

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
          // Padding(
          //   padding: const EdgeInsets.only(left: 15, bottom: 10),
          //   child: Row(
          //     children: [
          //       Text(
          //         "Discography",
          //         style: TextStyle(
          //             color: Colors.red,
          //             fontWeight: FontWeight.bold,
          //             fontSize: 25),
          //       ),
          //       Spacer(
          //         flex: 1,
          //       ),
          //       Padding(
          //         padding: EdgeInsets.only(right: 15, bottom: 10, top: 5),
          //         child: GestureDetector(
          //           onTap: () => Navigator.pushNamed(context, allsongs.id),
          //           child: Text(
          //             "See all",
          //             style: TextStyle(
          //                 color: Colors.amber,
          //                 fontWeight: FontWeight.bold,
          //                 fontSize: 23),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          //   const Discography_Pics_row(),
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
    return SizedBox(
      width: double.infinity,
      height: 400,
      child: ListView.builder(
        itemCount: audios1.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onDoubleTap: (){


              setState(() {
                Favorites.add(audios1[index]);
                FavouritesList_update(Favorites);
                print("***************");
                print(Favorites[0]);
                print("***************");
              });
            },
            onTap: () {
              Audio_Model.URI = audios1[index].uri;

              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Audio_Model();
                },
              ));
            },
            child: Pupular_Singles(
              Textt: audios1[index].title.substring(4, 20),
              Pictures: "assets/Rectangle 32.png",
            ),
          );
        },
        // children: [
        //   Pupular_Singles(
        //     Pictures: "assets/Rectangle 32.png",
        //
        //   ),
        //   Pupular_Singles(
        //     Pictures: "assets/Rectangle 34.png",
        //   ),
        //   Pupular_Singles(
        //     Pictures: "assets/Rectangle 38.png",
        //   ),
        //   Pupular_Singles(
        //     Pictures: "assets/Rectangle 39.png",
        //   ),
        //   Pupular_Singles(
        //     Pictures: "assets/Rectangle 32.png",
        //   ),
        //   Pupular_Singles(
        //     Pictures: "assets/Rectangle 34.png",
        //   ),
        //   Pupular_Singles(
        //     Pictures: "assets/Rectangle 38.png",
        //   ),
        //   Pupular_Singles(
        //     Pictures: "assets/Rectangle 39.png",
        //   ),
        //   Pupular_Singles(
        //     Pictures: "assets/Rectangle 32.png",
        //   ),
        //   Pupular_Singles(
        //     Pictures: "assets/Rectangle 34.png",
        //   ),
        //   Pupular_Singles(
        //     Pictures: "assets/Rectangle 38.png",
        //   ),
        //   Pupular_Singles(
        //     Pictures: "assets/Rectangle 39.png",
        //   ),
        // ],
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
    if (Pictures == null) {
      Pictures = "assets/Rectangle 32.png";
    }

    return Container(
      width: double.infinity,
      height: 120,
      child: Padding(
        padding: const EdgeInsets.all(17),
        child: Row(
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
                padding: const EdgeInsets.all(13),
                alignment: Alignment.topCenter,
                child: Text(
                  Textt!,
                  style: const TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )),
            const Spacer(
              flex: 1,
            ),
            IconButton(

                onPressed: () {











                },
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.white70,
                  size: 45,
                ))
          ],
        ),
      ),
    );
  }
}

class Custmo_ButtomNavigatorBar extends StatelessWidget {
  const Custmo_ButtomNavigatorBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 13),
            child: Column(
              children: [
                IconButton(
                    onPressed: () {

                      Navigator.push(context, MaterialPageRoute(builder: (context) => FavouritesList(),));

                    },
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    )),
                const Text(
                  "Favorite",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 13),
            child: Column(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    )),
                const Text(
                  "Search ",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 13),
            child: Column(
              children: [
                IconButton(
                    onPressed: () {
                     // Navigator.pushNamed(context, Gallery_Page.id);


                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.home,
                      color: Colors.white,
                    )),
                const Text(
                  "Home",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 13),
            child: Column(
              children: [
                IconButton(
                    onPressed: () {


                       Navigator.pushNamed(context, ElDossrieallsongs.id);


                    },
                    icon: const Icon(
                      Icons.music_note,
                      color: Colors.white,
                    )),
                const Text(
                  "El dossari",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 13),
            child: Column(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.person,
                      color: Colors.white,
                    )),
                const Text(
                  "Profile",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Row_Pictures extends StatelessWidget {
  Row_Pictures({super.key, this.Pictures});

  String? Pictures;

  @override
  Widget build(BuildContext context) {
    if (Pictures == null) {
      Pictures = "assets/Rectangle 32.png";
    }
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
