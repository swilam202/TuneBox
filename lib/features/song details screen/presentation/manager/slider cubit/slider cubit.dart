class SliderCubit extends Cubit<SliderState>{
  SliderCubit():super(InitSliderState());

  prog(double val){
    emit(SuccessSliderState(progress: val));
  }

}