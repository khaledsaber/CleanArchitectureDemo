  abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {
  // this class will hold all shared variables and functions that would be needed in multiple viewModels
}

abstract class BaseViewModelInputs {
  void start();

  void dispose();
}

mixin BaseViewModelOutputs {}
