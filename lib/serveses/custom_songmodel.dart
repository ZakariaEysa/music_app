import 'dart:convert';

class CustomSongModel {
  String uri;
  String artist;
  int? year;
  bool isMusic;
  String title;
  int? genreId;
  int size;
  int duration;
  bool isAlarm;
  String displayNameWithoutExtension;
  String? albumArtist;
  String? genre;
  bool isNotification;
  int track;
  String data;
  String displayName;
  String album;
  String? composer;
  bool isRingtone;
  int artistId;
  bool isPodcast;
  int bookmark;
  int dateAdded;
  bool isAudiobook;
  int dateModified;
  int albumId;
  String fileExtension;
  int id;

  CustomSongModel({
    required this.uri,
    required this.artist,
    this.year,
    required this.isMusic,
    required this.title,
    this.genreId,
    required this.size,
    required this.duration,
    required this.isAlarm,
    required this.displayNameWithoutExtension,
    this.albumArtist,
    this.genre,
    required this.isNotification,
    required this.track,
    required this.data,
    required this.displayName,
    required this.album,
    this.composer,
    required this.isRingtone,
    required this.artistId,
    required this.isPodcast,
    required this.bookmark,
    required this.dateAdded,
    required this.isAudiobook,
    required this.dateModified,
    required this.albumId,
    required this.fileExtension,
    required this.id,
  });

  static List<CustomSongModel> fromJsonString(String jsonString) {
    List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((json) => CustomSongModel.fromJson(json)).toList();
  }

  factory CustomSongModel.fromJson(Map<String, dynamic> json) {
    return CustomSongModel(
      uri: json['_uri'],
      artist: json['artist'],
      year: json['year'],
      isMusic: json['is_music'],
      title: json['title'],
      genreId: json['genre_id'],
      size: json['_size'],
      duration: json['duration'],
      isAlarm: json['is_alarm'],
      displayNameWithoutExtension: json['_display_name_wo_ext'],
      albumArtist: json['album_artist'],
      genre: json['genre'],
      isNotification: json['is_notification'],
      track: json['track'],
      data: json['_data'],
      displayName: json['_display_name'],
      album: json['album'],
      composer: json['composer'],
      isRingtone: json['is_ringtone'],
      artistId: json['artist_id'],
      isPodcast: json['is_podcast'],
      bookmark: json['bookmark'],
      dateAdded: json['date_added'],
      isAudiobook: json['is_audiobook'],
      dateModified: json['date_modified'],
      albumId: json['album_id'],
      fileExtension: json['file_extension'],
      id: json['_id'],
    );
  }
}
