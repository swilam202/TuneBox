

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

abstract class SliderState{}

class InitSliderState extends SliderState{}

class SuccessSliderState extends SliderState{
  double progress;

  SuccessSliderState({required this.progress});
}
class LoadingSliderState extends SliderState{}





class SliderCubit extends Cubit<SliderState>{
  SliderCubit():super(InitSliderState());
  
  prog(double val){
      
      
  emit(SuccessSliderState(progress: val));
  }

}