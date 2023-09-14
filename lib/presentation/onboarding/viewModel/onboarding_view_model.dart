import 'dart:async';

import 'package:clean_architecture_demo/presentation/base/base_view_model.dart';

import '../../../domain/model/models.dart';
import '../../resources/assets_manager.dart';
import '../../resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {

  final StreamController _streamController =
      StreamController<SliderViewObject>();

  late final List<SliderObject> _list;

  int _currentIndex = 0;

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSlideData();
    _postDataToView();
  }

  @override
  int goNext() {
    int nextIndex = ++_currentIndex;

    if (nextIndex == _list.length) {
      nextIndex = 0;
    }

    return nextIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = --_currentIndex;

    if (previousIndex == -1) {
      previousIndex = _list.length - 1;
    }

    return previousIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

// onBoarding private functions

  List<SliderObject> _getSlideData() => [
        SliderObject(
            title: AppStrings.onBoardingTitle1,
            subtitle: AppStrings.onBoardingSubtitle1,
            image: ImageAssets.onBoardingLogo1),
        SliderObject(
            title: AppStrings.onBoardingTitle2,
            subtitle: AppStrings.onBoardingSubtitle2,
            image: ImageAssets.onBoardingLogo2),
        SliderObject(
            title: AppStrings.onBoardingTitle3,
            subtitle: AppStrings.onBoardingSubtitle3,
            image: ImageAssets.onBoardingLogo3),
        SliderObject(
            title: AppStrings.onBoardingTitle4,
            subtitle: AppStrings.onBoardingSubtitle4,
            image: ImageAssets.onBoardingLogo4),
      ];

  void _postDataToView() {
    inputSliderViewObject.add(
        SliderViewObject(_list[_currentIndex], _list.length, _currentIndex));
  }
}

// orders that view model receives from view
mixin OnBoardingViewModelInputs {
  // when user clicks right arrow, or swipe to left direction
  int goNext();

  //when user clicks left arrow or swipe to right direction
  int goPrevious();

  void onPageChanged(int index);

// stream controller inputs

  Sink get inputSliderViewObject;
}

mixin OnBoardingViewModelOutputs {
  //stream controller outputs
  Stream<SliderViewObject> get outputSliderViewObject;
}
