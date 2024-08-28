import 'package:flutter/material.dart';
import 'package:linkyou_task/Core/Assets/animation_assets.dart';
import 'package:linkyou_task/Core/Base/base_navigator.dart';
import 'package:linkyou_task/Core/Base/base_view_model.dart';
import 'package:linkyou_task/Core/Utils/dialog_utils.dart';

abstract class BaseStateState<T extends StatefulWidget,
    VM extends BaseViewModel> extends State<T> implements BaseNavigator {
  late VM viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = initViewModel();
    viewModel.navigator = this;
  }

  @override
  void dispose() {
    viewModel.navigator = null;
    super.dispose();
  }

  VM initViewModel();

  @override
  void hideDialog() {
    Navigator.pop(context);
  }

  @override
  void showFailDialog(
      {required String message,
      String? posActionTitle,
      VoidCallback? posAction,
      String? negativeActionTitle,
      VoidCallback? negativeAction}) {
    MyDialogUtils.showDialogOnScreen(
        context: context,
        message: message,
        imagePath: AnimationAssets.errorAnimation,
        posAction: posAction,
        negativeAction: negativeAction,
        negativeActionTitle: negativeActionTitle,
        posActionTitle: posActionTitle);
  }

  @override
  void showInfoDialog(
      {required String message,
      String? posActionTitle,
      VoidCallback? posAction,
      String? negativeActionTitle,
      VoidCallback? negativeAction}) {
    MyDialogUtils.showDialogOnScreen(
        context: context,
        message: message,
        imagePath: AnimationAssets.infoAnimation,
        posAction: posAction,
        negativeAction: negativeAction,
        negativeActionTitle: negativeActionTitle,
        posActionTitle: posActionTitle);
  }

  @override
  void showLoading({required String message}) {
    MyDialogUtils.showLoadingDialog(context: context, message: message);
  }

  @override
  void showSuccessDialog(
      {required String message,
      String? posActionTitle,
      VoidCallback? posAction,
      String? negativeActionTitle,
      VoidCallback? negativeAction}) {
    MyDialogUtils.showDialogOnScreen(
        context: context,
        message: message,
        imagePath: AnimationAssets.checkAnimation,
        posAction: posAction,
        negativeAction: negativeAction,
        negativeActionTitle: negativeActionTitle,
        posActionTitle: posActionTitle);
  }
}
