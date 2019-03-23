import 'package:flutter/material.dart';
import 'bloc.dart';
class BaseWidget extends InheritedWidget {
  final bloc=Bloc();
  final Widget child;
  BaseWidget({this.child});

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static BaseWidget of(BuildContext context)=>context.inheritFromWidgetOfExactType(BaseWidget);
  
}