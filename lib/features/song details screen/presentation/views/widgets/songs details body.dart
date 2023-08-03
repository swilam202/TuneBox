//import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/features/song%20details%20screen/presentation/views/widgets/control%20row.dart';

import '../../../../home screen/data/song model.dart';



class SongDetailsBody extends StatelessWidget {
  SongDetailsBody({super.key,required this.song});
 // final player = AudioPlayer();
  double sliderVal = 0;
  final Song song;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_down_sharp,
                    size: 50,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image:  DecorationImage(
                  image: MemoryImage(
                    song.image!
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 30),
             Text(
              song.title ?? 'No name',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            Text(
              song.artist ?? 'Unknown',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.white.withOpacity(0.7),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 30),
            Slider(value: sliderVal, onChanged: (val) => sliderVal = val),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(sliderVal.toString()),
                  Text('${song.duration ?? 0}'),
                ],
              ),
            ),
             Expanded(child: SongDetailsControlRow(song: song,))
          ],
        ),
      ),
    );
  }
}
