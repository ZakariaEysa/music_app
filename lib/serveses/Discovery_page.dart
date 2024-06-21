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

import 'package:flutter/material.dart';
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