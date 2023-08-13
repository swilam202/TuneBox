abstract class SliderState{}

class InitSliderState extends SliderState{}

class SuccessSliderState extends SliderState{
  double progress = 0.0;
  SuccessSliderState({required this.progress});
}
class LoadingSliderState extends SliderState{}