import 'package:flutter/material.dart';

import '../Views/Favourites_list.dart';
import 'dosstie_list.dart';
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FavouritesList(),
                          ));
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
            width: 40,
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 10, bottom: 13),
          //   child: Column(
          //     children: [
          //       IconButton(
          //           onPressed: () {},
          //           icon: const Icon(
          //             Icons.search,
          //             color: Colors.white,
          //           )),
          //       const Text(
          //         "Search ",
          //         style: TextStyle(color: Colors.white),
          //       )
          //     ],
          //   ),
          // ),
          // const SizedBox(
          //   width: 20,
          // ),
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
            width: 40,
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
            width: 40,
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