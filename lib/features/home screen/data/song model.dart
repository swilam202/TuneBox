


import 'dart:typed_data';

class Song{
  final int? id;
  final String? title;
  final String? data;
  final int? duration;
  final String? artist;
  final  Uint8List? image;
  Song({this.id,this.title,this.artist,this.data,this.image,this.duration,});

  // factory Song.fromJson(Map json){
  //   return Song(
  //     title: json['title'],
  //     data: json['data'],
  //     artist: json['artist'],
  //   );
  // }
}