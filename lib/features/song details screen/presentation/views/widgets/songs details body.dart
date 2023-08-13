//import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicapp/core/widgets/states%20handeling/loading%20state.dart';
import 'package:musicapp/features/song%20details%20screen/presentation/controller/song%20details%20controller.dart';
import 'package:musicapp/features/song%20details%20screen/presentation/manager/song%20details%20cubit.dart';
import 'package:musicapp/features/song%20details%20screen/presentation/views/widgets/control%20row.dart';
import 'package:musicapp/slider%20cubit.dart';

import '../../../../../core/widgets/get image.dart';
import '../../../../home screen/data/song model.dart';
import '../../../../home screen/presentation/manager/home page cubit.dart';
import 'package:get/get.dart';


class SongDetailsBody extends StatefulWidget {
  SongDetailsBody({super.key,required this.song,required this.index});

  final Song song;
  final int index;

  @override
  State<SongDetailsBody> createState() => _SongDetailsBodyState();
}

class _SongDetailsBodyState extends State<SongDetailsBody> {
 // final player = AudioPlayer();
SongDetailsController controller = Get.put(SongDetailsController());
//late Song song;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.chekIfFavorite(songId: widget.song.id!);
  // song =  BlocProvider.of<SongDetailsCubit>(context).loadSong(widget.index);
 BlocProvider.of<SliderCubit>(context).prog(0.0);
  }

  @override
  Widget build(BuildContext context) {
//double v = 0.0;
    return Obx(() => SafeArea(
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
            Expanded(
              //height: MediaQuery.of(context).size.height *0.5,
              child: AspectRatio(
                aspectRatio: 2/1,
                child: Container(

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image:  DecorationImage(
                      image: getImage(widget.song.image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
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
         
            BlocBuilder<SliderCubit,SliderState>(
              builder: (context, state) {
                if(state is SuccessSliderState){
                return    Slider(
                    value: state.progress, 
                    onChanged: (val)async{
                      await controller.player.value.seek(Duration(milliseconds: val.toInt()));
                     BlocProvider.of<SliderCubit>(context).prog(val);
                      },
                  min: 0,
                  max: widget.song.duration!.toDouble(),
                           );
                }
                else{
                  return LoadignState();
                }
              },
            ),
         /*
          Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(controller.player.value.position.inMilliseconds.toString()),
                  Text('${ widget.song.duration?.toInt() ?? 0}'),
                ],
              ),
            ),
           */ 
            const SizedBox(height: 30),
             SongDetailsControlRow(song:  widget.song,index: widget.index),

            const SizedBox(height: 40),
          ],
        ),
      ),
    )
 );
     }


}
