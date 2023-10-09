import 'package:clean_architecture_demo/presentation/common/state_renderer/state_renderer.dart';
import 'package:clean_architecture_demo/presentation/resources/strings_manager.dart';

abstract class FlowState{
  StateRendererType getStateRendererType();
  String getMessage();
}

class LoadingState extends FlowState{
  StateRendererType stateRendererType;
  String? message;


  LoadingState({required this.stateRendererType, this.message = AppStrings.loading});

  @override
  String getMessage()=> message!;

  @override
  StateRendererType getStateRendererType() =>stateRendererType;
}