import 'package:flutter/material.dart';



class LoginMediator extends InheritedWidget {
  const LoginMediator({
    super.key, 
    required Widget child,  
    required this.pageController,
  }) : super(child: child);

  final PageController pageController;

  static LoginMediator of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LoginMediator>()!;
  }

  @override
  bool updateShouldNotify(LoginMediator oldWidget) {
    return false;
  }
}