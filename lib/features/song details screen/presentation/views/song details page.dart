import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:musicapp/features/song%20details%20screen/presentation/manager/song%20details%20cubit/song%20details%20cubit.dart';
import 'package:musicapp/features/song%20details%20screen/presentation/manager/song%20details%20state.dart';


import '../../../home screen/data/song model.dart';
import '../../../home screen/presentation/manager/home page cubit.dart';
import 'widgets/songs details body.dart';



class SongDetailsPage extends StatefulWidget {
   const SongDetailsPage({super.key,required this.index});
   final int index;

  @override
  State<SongDetailsPage> createState() => _SongDetailsPageState();
}

class _SongDetailsPageState extends State<SongDetailsPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<SongDetailsCubit>(context).index = widget.index;
    BlocProvider.of<SongDetailsCubit>(context).loadSong();
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: BlocBuilder<SongDetailsCubit,SongDetailsState>(
        builder: (context,state){
          if(state is SongDetailsSuccessState){
           return SongDetailsBody(song: state.song,index: widget.index,);
          }
          else if(state is SongDetailsFailureState){
            return Center(child: Text(state.errorMessage),);
          }
          else{
            return Center(child: LoadingAnimationWidget.staggeredDotsWave(color: Colors.white, size: 50),);
          }
        },
      )
    );
  }
}
