import 'package:clean_architecture_demo/presentation/resources/assets_manager.dart';
import 'package:clean_architecture_demo/presentation/resources/fonts_manager.dart';
import 'package:clean_architecture_demo/presentation/resources/styles_manager.dart';
import 'package:clean_architecture_demo/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../data/network/failure.dart';
import '../../resources/color_manager.dart';
import '../../resources/strings_manager.dart';

enum StateRendererType {
  //POPUP STATE (DIALOG)
  POPUP_LOADING_STATE,
  POPUP_ERROR_STATE,

  //FULL SCREEN STATE (FULL SCREEN)
  FULL_SCREEN_LOADING_STATE,
  FULL_SCREEN_ERROR_STATE,
  FULL_SCREEN_EMPTY_STATE,

  // GENERAL

  CONTETNT_STATE
}

class StateRenderer extends StatelessWidget {
  StateRendererType stateRendererType;
  String message;
  String title;
  Function retryActionFunction;

  StateRenderer(
      {super.key,
      required this.stateRendererType,
      this.message = "Loading...",
      this.title = "",
      required this.retryActionFunction});

  @override
  Widget build(BuildContext context) {
    return _getStataWidget(context);
  }

  Widget _getStataWidget(BuildContext context) {
    return switch (stateRendererType) {
      StateRendererType.POPUP_LOADING_STATE => _getPopUpDialogue(
          context,
          [
            _getAnimatedImage(JsonAssets.loading),
          ],
        ),
      StateRendererType.POPUP_ERROR_STATE => _getPopUpDialogue(
          context,
          [
            _getAnimatedImage(JsonAssets.error),
            _getMessage(message),
            _getRetryButton(context, AppStrings.ok)
          ],
        ),
      StateRendererType.FULL_SCREEN_LOADING_STATE => _getItemColumns(
          [
            _getAnimatedImage(JsonAssets.loading),
            _getMessage(message),
          ],
        ),
      StateRendererType.FULL_SCREEN_ERROR_STATE => _getItemColumns([
          _getAnimatedImage(JsonAssets.error),
          _getMessage(message),
          _getRetryButton(context, AppStrings.retryAgain)
        ]),
      StateRendererType.FULL_SCREEN_EMPTY_STATE => _getItemColumns(
          [
            _getAnimatedImage(JsonAssets.empty),
            _getMessage(message),
          ],
        ),
      StateRendererType.CONTETNT_STATE => Container()
    };
  }

  Widget _getItemColumns(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getAnimatedImage(String animationName) {
    return SizedBox(
      height: AppSize.s100,
      width: AppSize.s100,
      child: Lottie.asset(animationName), // to add json later
    );
  }

  Widget _getMessage(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Text(
          message,
          style: getRegularStyle(color: Colors.black, fontSize: FontSize.s18),
        ),
      ),
    );
  }

  // in case of error
  Widget _getRetryButton(BuildContext context, String buttonTitle) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  if (stateRendererType ==
                      StateRendererType.FULL_SCREEN_ERROR_STATE) {
                    retryActionFunction.call();
                  } else {
                    Navigator.of(context).pop();
                  }
                },
                child: Text(buttonTitle))),
      ),
    );
  }

  Widget _getPopUpDialogue(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s14)),
      elevation: AppSize.s1_5,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: ColorManager.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(AppSize.s14),
            boxShadow: const [BoxShadow(color: Colors.black26)]),
        child: _getDialogContent(context, children),
      ),
    );
  }

  Widget _getDialogContent(BuildContext context, List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }
}
