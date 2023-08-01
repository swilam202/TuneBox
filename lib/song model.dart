import 'dart:typed_data';

class Song {
  final String data;
  final String? artist;
  final String title;
  final int? duration;
  final Uint8List? image;

  Song({
    required this.data,
     this.duration,
     this.artist,
    required this.title,
    this.image,
  });
}
