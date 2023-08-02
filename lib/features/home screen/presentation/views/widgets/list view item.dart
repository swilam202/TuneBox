import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';
import 'package:musicapp/features/home%20screen/data/song%20model.dart';
import 'package:musicapp/features/song%20details%20screen/presentation/views/song%20details%20page.dart';
import 'package:on_audio_query/on_audio_query.dart';

class ListViewItem extends StatefulWidget {
  const ListViewItem({super.key, required this.song});

  final Song song;

  @override
  State<ListViewItem> createState() => _ListViewItemState();
}

class _ListViewItemState extends State<ListViewItem> {

  Uint8List? ima;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  // getImage()async{
  //   final metaData = await MetadataRetriever.fromFile(File(widget.song.data!));
  //   setState(() {
  //     ima = metaData.albumArt;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const SongDetailsPage(),),);
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
                  image: MemoryImage(widget.song.image!),
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
                    widget.song.title ?? 'No name',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5),
                  Text(
                    widget.song.artist ?? 'Unkown',
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
