import 'dart:typed_data';

class Song {
  final int? id;
  final String? title;
  final String? data;
  final int? duration;
  final String? artist;
  final int songId;

  Song({
    this.id,
    this.title,
    this.artist,
    this.data,
    required this.songId,
    this.duration,
  });
}
