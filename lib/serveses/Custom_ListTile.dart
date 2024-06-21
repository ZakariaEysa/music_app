import 'package:flutter/material.dart';
class CustomListTile extends StatelessWidget {
   CustomListTile({super.key,required this.name,required this.artist});
  String name;

  String artist;

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading: Icon(Icons.music_note),
      title: Text(
        name,
        style: const TextStyle(
          height: 1.3,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        textAlign: TextAlign.left,
      ),
      subtitle: Text(artist ?? ""),
      trailing: Icon(Icons.more_horiz),
    );
  }
}
