//import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/features/song%20details%20screen/presentation/manager/song%20details%20cubit.dart';
import 'package:musicapp/features/song%20details%20screen/presentation/views/widgets/control%20row.dart';

import '../../../../home screen/data/song model.dart';
import '../../../../home screen/presentation/manager/home page cubit.dart';



class SongDetailsBody extends StatefulWidget {
  SongDetailsBody({super.key,required this.song});

  final Song song;

  @override
  State<SongDetailsBody> createState() => _SongDetailsBodyState();
}

class _SongDetailsBodyState extends State<SongDetailsBody> {
 // final player = AudioPlayer();
  double sliderVal = 0;
//late Song song;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
 //  song =  BlocProvider.of<SongDetailsCubit>(context).loadSong(widget.index);
  }

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
                      widget.song.image!
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 30),
             Text(
              widget.song.title ?? 'No name',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            Text(
              widget.song.artist ?? 'Unknown',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.white.withOpacity(0.7),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 30),
            Slider(value: sliderVal, onChanged: (val) async{
              await BlocProvider.of<SongDetailsCubit>(context).player.seek(Duration(milliseconds: 2500));
            }),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(sliderVal.toString()),
                  Text('${ widget.song.duration ?? 0}'),
                ],
              ),
            ),
             Expanded(child: SongDetailsControlRow(song:  widget.song))
          ],
        ),
      ),
    );
  }
}
