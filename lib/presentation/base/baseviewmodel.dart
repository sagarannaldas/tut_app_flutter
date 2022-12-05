abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {
  // shared variables and functions that will be used through any view model.

}

abstract class BaseViewModelInputs {
  void start(); // will be called while initialization of view model
  void dispose(); // ill be called when view model dies
}

abstract class BaseViewModelOutputs {}
