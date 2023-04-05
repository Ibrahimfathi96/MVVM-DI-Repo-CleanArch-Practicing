import 'package:flutter/material.dart';
import 'package:route_ecommerce/base/base_navigator.dart';

class BaseViewModel<N extends BaseNavigator> extends ChangeNotifier{
  N? navigator;
}