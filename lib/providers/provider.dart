import 'package:emailapp/models/contact_manager.dart';
import 'package:flutter/material.dart';

class Provider<T> extends InheritedWidget {
  Provider({Key? key, required this.child, required this.data}) : super(key: key, child: child);

  final T data;
  final Widget child;

  static Type _typeOf<T>() => T;
  static ContactManager of<T>(BuildContext context) {
    final type = _typeOf<Provider<T>>();
    return (context.dependOnInheritedWidgetOfExactType<Provider>() as Provider).data;
  }

  @override
  bool updateShouldNotify(Provider oldWidget) {
    return true;
  }
}
