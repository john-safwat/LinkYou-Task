import 'package:flutter/material.dart';

abstract class BaseNavigator {


  void hideDialog();

  void showLoading({
    required String message ,
  });

  void showSuccessDialog({
    required String message ,
    String? posActionTitle ,
    VoidCallback? posAction,
    String? negativeActionTitle,
    VoidCallback? negativeAction,
  });

  void showFailDialog({
    required String message ,
    String? posActionTitle ,
    VoidCallback? posAction,
    String? negativeActionTitle,
    VoidCallback? negativeAction,
  });

  void showInfoDialog({
    required String message ,
    String? posActionTitle ,
    VoidCallback? posAction,
    String? negativeActionTitle,
    VoidCallback? negativeAction,
  });

}