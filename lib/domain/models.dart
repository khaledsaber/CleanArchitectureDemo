
// onBoarding Models
class SliderObject {
  final String title;
  final String subtitle;
  final String image;

  SliderObject(
      {required this.title, required this.subtitle, required this.image});
}


class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;

  SliderViewObject(this.sliderObject, this.numOfSlides, this.currentIndex);
}
