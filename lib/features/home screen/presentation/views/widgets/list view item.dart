import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';


import 'package:on_audio_query/on_audio_query.dart';


import '../../../../song details screen/presentation/views/song details page.dart';
import '../../../data/song model.dart';



class ListViewItem extends StatelessWidget {
   const ListViewItem({super.key,required this.song});

  final Song song;





  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SongDetailsPage(song: song),),);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 2,
              color: Colors.grey,
            ),
          ),
        ),
        child: Row(
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.red,
                image:  DecorationImage(
                  image: MemoryImage(song.image!),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(width: 20),
             Expanded(
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    song.title ?? 'No name',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5),
                  Text(
                    song.artist ?? 'Unkown',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
            ),
             ),

            const Icon(
              Icons.play_arrow,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
