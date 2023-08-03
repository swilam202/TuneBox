import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
//import 'package:musicapp/features/song%20details%20screen/presentation/manager/song%20details%20cubit.dart';
//import 'package:musicapp/features/song%20details%20screen/presentation/manager/song%20details%20state.dart';


import '../../../home screen/data/song model.dart';
import 'widgets/songs details body.dart';



class SongDetailsPage extends StatelessWidget {
   const SongDetailsPage({super.key,required this.song});
   final Song song;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SongDetailsBody(song: song,),
    );
  }
}
