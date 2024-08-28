import 'package:flutter/material.dart';
import 'package:linkyou_task/Core/Base/base_navigator.dart';

abstract class BaseViewModel<N extends BaseNavigator> extends ChangeNotifier {

  N? navigator;

}