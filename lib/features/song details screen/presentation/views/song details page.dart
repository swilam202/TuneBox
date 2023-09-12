import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../home screen/data/song model.dart';
import '../manager/song details cubit/song details cubit.dart';
import '../manager/song details cubit/song details state.dart';
import 'widgets/songs details body.dart';



class SongDetailsPage extends StatefulWidget {
  const SongDetailsPage({super.key, required this.song});
    final Song song;

  @override
  State<SongDetailsPage> createState() => _SongDetailsPageState();
}

class _SongDetailsPageState extends State<SongDetailsPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<SongDetailsCubit>(context).loadSong(widget.song.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
       /*SongDetailsBody(
        song: song,
      ),*/
      BlocBuilder<SongDetailsCubit, SongDetailsState>(
      builder: (context, state) {
        if (state is SongDetailsSuccessState) {
          return SongDetailsBody(
            song: state.song,
        
          );
        } else if (state is SongDetailsFailureState) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return Center(
            child: LoadingAnimationWidget.staggeredDotsWave(
                color: Colors.white, size: 50),
          );
        }
      },
    ),
 
);
 }
}
