


import 'dart:typed_data';

class Song{
  final String? title;
  final String? data;
  final int? duration;
  final String? artist;
  final  Uint8List? image;
  Song({this.title,this.artist,this.data,this.image,this.duration,});

  // factory Song.fromJson(Map json){
  //   return Song(
  //     title: json['title'],
  //     data: json['data'],
  //     artist: json['artist'],
  //   );
  // }
}