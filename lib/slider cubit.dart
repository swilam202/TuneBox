

import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SliderState{}

class InitSliderState extends SliderState{}

class SuccessSliderState extends SliderState{
  double progress =0.0;
  SuccessSliderState({required this.progress});
}
class LoadingSliderState extends SliderState{}





class SliderCubit extends Cubit<SliderState>{
  SliderCubit():super(InitSliderState());

  prog(double val){
  emit(SuccessSliderState(progress: val));
  }

}