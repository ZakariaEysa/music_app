// import 'package:flutter/material.dart';
//
// class Characters {
//   late int id;
//   late String name;
//   late String status;
//   late String species;
//   late String type;
//   late String gender;
//   late String Location_origin;
//   late String Location_location;
//   late String image;
//   late List<dynamic> episode;
//   late String url;
//   late String created;
//
//   Characters({
//     required this.id,
//     required this.name,
//     required this.status,
//     required this.species,
//     required this.type,
//     required this.gender,
//     required this.Location_origin,
//     required this.Location_location,
//     required this.image,
//     required this.episode,
//     required this.url,
//     required this.created,
//   });
//
//   factory Characters.fromJson(Map<String, dynamic> json) {
//     return Characters(
//       id: json['id'],
//       name: json['name'],
//       status: json['status'],
//       species: json['species'],
//       type: json['type'],
//       gender: json['gender'],
//       Location_origin: json['origin']["url"],
//       Location_location: json['location']["url"],
//       image: json['image'],
//       episode: json['episode'],
//       url: json['url'],
//       created: json['created'],
//     );
//   }
// }
