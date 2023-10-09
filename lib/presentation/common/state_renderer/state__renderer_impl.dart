import 'package:clean_architecture_demo/app/constants.dart';
import 'package:clean_architecture_demo/presentation/common/state_renderer/state_renderer.dart';
import 'package:clean_architecture_demo/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

abstract class FlowState {
  StateRendererType getStateRendererType();

  String getMessage();
}

class LoadingState extends FlowState {
  StateRendererType stateRendererType;
  String? message;

  LoadingState(
      {required this.stateRendererType, this.message = AppStrings.loading});

  @override
  String getMessage() => message!;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

class ErrorState extends FlowState {
  StateRendererType stateRendererType;
  String message;

  ErrorState(this.stateRendererType, this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

class ContentState extends FlowState {
  ContentState();

  @override
  String getMessage() => Constants.empty;

  @override
  StateRendererType getStateRendererType() => StateRendererType.CONTETNT_STATE;
}

class EmptyState extends FlowState {
  String message;

  EmptyState(this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.FULL_SCREEN_EMPTY_STATE;
}



extension FlowStateExtension on FlowState{
  Widget getScreenWidget(BuildContext context,Widget contentScreen, Function retryActionFunction){

     return switch(this.runtimeType){
       LoadingState=>
     ErrorState
       EmptyState
     ContentState
     }


  }
}
